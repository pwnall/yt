require 'yt/models/base'

module Yt
  module Models
    # Provides methods to interact with YouTube subscriptions.
    # @see https://developers.google.com/youtube/v3/docs/subscriptions
    class Subscription < Base
      # @return [String] the ID that uniquely identify a YouTube subscription.
      attr_reader :id, :auth

      has_one :snippet
      # @note: Snippet also includes channel_id and channel_title, but it may
      # be confusing to expose them, since they refer to the channel that
      # created the subscription, not the channel it subscribed to.
      delegate :title, :description, :thumbnail_url, :published_at,
        to: :snippet

      def initialize(options = {})
        @id = options[:id]
        @auth = options[:auth]
        @snippet = Snippet.new(data: options[:snippet]) if options[:snippet]
      end

      def delete(options = {})
        begin
          do_delete {@id = nil}
        rescue Yt::Error => error
          ignorable_errors = error.reasons & ['subscriptionNotFound']
          raise error unless options[:ignore_errors] && ignorable_errors.any?
          @id = nil
        end
        !exists?
      end

      def exists?
        !@id.nil?
      end

    private

      # @return [Hash] the parameters to submit to YouTube to delete a subscription.
      # @see https://developers.google.com/youtube/v3/docs/subscriptions/delete
      def delete_params
        super.tap do |params|
          params[:path] = '/youtube/v3/subscriptions'
          params[:params] = {id: @id}
        end
      end
    end
  end
end