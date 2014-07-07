# encoding: UTF-8

require 'spec_helper'
require 'yt/models/subscription'

describe Yt::Subscription, :device_app do
  subject(:subscription) { Yt::Subscription.new id: id, auth: $account }

  context 'given one of my subscriptions' do
    let(:id) { '5GRxNxk3IHLSRtWOUojJ3SwPvDooXERDBk1D2gNfcQU' } # TODO !!!! MAKE AN ENV !!!!!

    it 'returns valid snippet data' do
      expect(subscription.snippet).to be_a Yt::Snippet
      expect(subscription.title).to be_a String
      expect(subscription.description).to be_a Yt::Description
      expect(subscription.thumbnail_url).to be_a String
      expect(subscription.published_at).to be_a Time
    end
  end
end