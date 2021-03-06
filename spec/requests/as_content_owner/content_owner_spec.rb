require 'spec_helper'
require 'yt/models/content_owner'

describe Yt::ContentOwner, :partner do
  describe '.partnered_channels.first' do
    it { expect($content_owner.partnered_channels.first).to be_a Yt::Channel }
  end

  describe '.partnered_channels.size', :ruby2 do
    it { expect($content_owner.partnered_channels.size).to be > 0 }
  end

  describe '.claims' do
    describe 'given the content owner has policies' do
      let(:claim) { $content_owner.claims.first }

      it 'returns valid metadata' do
        expect(claim.id).to be_a String
        expect(claim.asset_id).to be_a String
        expect(claim.video_id).to be_a String
        expect(claim.status).to be_in Yt::Claim::STATUSES
        expect(claim.content_type).to be_in Yt::Claim::CONTENT_TYPES
        expect(claim.created_at).to be_a Time
        expect(claim).not_to be_third_party
      end
    end

    describe '.where(id: claim_id)' do
      let(:count) { $content_owner.claims.where(id: claim_id).count }

      context 'given the ID of a claim administered by the content owner' do
        let(:claim_id) { ENV['YT_TEST_PARTNER_CLAIM_ID'] }
        it { expect(count).to be > 0 }
      end

      context 'given an unknown claim ID' do
        let(:claim_id) { '--not-a-matching-claim-id--' }
        it { expect(count).to be_zero }
      end
    end

    describe '.where(asset_id: asset_id)' do
      let(:count) { $content_owner.claims.where(asset_id: asset_id).count }

      context 'given the asset ID of a claim administered by the content owner' do
        let(:asset_id) { ENV['YT_TEST_PARTNER_ASSET_ID'] }
        it { expect(count).to be > 0 }
      end

      context 'given an unknown asset ID' do
        let(:asset_id) { 'A123456789012345' }
        it { expect(count).to be_zero }
      end
    end

    describe '.where(video_id: video_id)' do
      let(:count) { $content_owner.claims.where(video_id: video_id).count }

      context 'given the video ID of a claim administered by the content owner' do
        let(:video_id) { ENV['YT_TEST_PARTNER_VIDEO_ID'] }
        it { expect(count).to be > 0 }
      end
    end

    describe '.where(q: query)' do
      let(:first) { $content_owner.claims.where(params).first }

      context 'given a query matching the title of a video of a claim administered by the content owner' do
        let(:query) { ENV['YT_TEST_PARTNER_Q'] }

        context 'given no optional filters' do
          let(:params) { {q: query} }
          it { expect(first).to be }
        end

        context 'given an optional filter that does not include that video' do
          let(:remote_date) { '2008-01-01T00:00:00.000Z' }

          describe 'applies the filter if the filter name is under_scored' do
            let(:params) { {q: query, created_before: remote_date} }
            it { expect(first).not_to be }
          end

          describe 'applies the filter if the filter name is camelCased' do
            let(:params) { {q: query, createdBefore: remote_date} }
            it { expect(first).not_to be }
          end
        end
      end

      context 'given an unknown video ID' do
        let(:params) { {q: '--not-a-matching-query--'} }
        it { expect(first).not_to be }
      end
    end
  end

  describe 'references' do
    let(:claim_id) { ENV['YT_TEST_PARTNER_REFERENCE_CLAIM_ID'] }
    let(:content_type) { ENV['YT_TEST_PARTNER_REFERENCE_CONTENT_TYPE'] }
    let(:params) { {claim_id: claim_id, content_type: content_type} }

    specify 'can be added' do
      begin
        expect($content_owner.create_reference params).to be_a Yt::Reference
      rescue Yt::Errors::RequestError => e
        # @note: Every time this test runs, a reference is inserted for the
        #   same claim, but YouTube does not allow this, and responds with an
        #   error message like "You attempted to create a reference using the
        #   content of a previously claimed video, but such a reference already
        #   exists. The ID of the duplicate reference is xhpACYclOdc."
        #   For the sake of testing, we delete the duplicate and try again.
        # @note: Deleting a reference does not work if the reference status is
        #   "checking" or "pending" and it can take up to 4 minutes for a new
        #   reference to be checked. The +sleep+ statement takes care of this
        #   case in the only way allowed by YouTube: sadly waiting.
        raise unless e.reasons.include? 'referenceAlreadyExists'
        id = e.kind['message'].match(/reference is (.*?)\.$/) {|re| re[1]}
        sleep 15 until Yt::Reference.new(id: id, auth: $content_owner).delete
        expect($content_owner.create_reference params).to be_a Yt::Reference
      end
    end
  end

  describe '.references' do
    describe '.where(id: reference_id)' do
      let(:reference) { $content_owner.references.where(id: reference_id).first }

      context 'given the ID of a reference administered by the content owner' do
        let(:reference_id) { ENV['YT_TEST_PARTNER_REFERENCE_ID'] }

        it 'returns valid metadata' do
          expect(reference.id).to be_a String
          expect(reference.asset_id).to be_a String
          expect(reference.length).to be_a Float
          expect(reference.video_id).to be_a String
          expect(reference.claim_id).to be_a String
          expect(reference.audioswap_enabled?).to be_in [true, false]
          expect(reference.ignore_fp_match?).to be_in [true, false]
          expect(reference.urgent?).to be_in [true, false]
          expect(reference.status).to be_in Yt::Reference::STATUSES
          expect(reference.content_type).to be_in Yt::Reference::CONTENT_TYPES
        end
      end

      context 'given an unknown reference ID' do
        let(:reference_id) { '--not-a-matching-reference-id--' }
        it { expect(reference).not_to be }
      end
    end
  end

  describe '.policies' do
    describe 'given the content owner has policies' do
      let(:policy) { $content_owner.policies.first }
      let(:rule) { policy.rules.first }

      it 'returns valid metadata' do
        expect(policy.id).to be_a String
        expect(policy.name).to be_a String
        expect(policy.updated_at).to be_a Time
        expect(rule.action).to  be_in Yt::PolicyRule::ACTIONS
        expect(rule.included_territories).to be_an Array
        expect(rule.excluded_territories).to be_an Array
        expect(rule.match_duration).to be_an Array
        expect(rule.match_percent).to be_an Array
        expect(rule.reference_duration).to be_an Array
        expect(rule.reference_percent).to be_an Array
      end
    end

    describe '.where(id: policy_id) given an unknown policy ID' do
      let(:policy) { $content_owner.policies.where(id: policy_id).first }
      let(:policy_id) { '--not-a-matching-reference-id--' }
      it { expect(policy).not_to be }
    end
  end
end