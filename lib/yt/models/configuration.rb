module Yt
  module Models
    # Provides an object to store global configuration settings.
    #
    # This class is typically not used directly, but by calling
    # {Yt::Config#configure Yt.configure}, which creates and updates a single
    # instance of {Yt::Models::Configuration}.
    #
    # @example Set the API client id/secret for a web-client YouTube app:
    #   Yt.configure do |config|
    #     config.client_id = 'ABCDEFGHIJ1234567890'
    #     config.client_secret = 'ABCDEFGHIJ1234567890'
    #   end
    #
    # @see Yt::Config for more examples.
    #
    # An alternative way to set global configuration settings is by storing
    # them in the following environment variables:
    #
    # * +YT_CLIENT_ID+ to store the Client ID for web/device apps
    # * +YT_CLIENT_SECRET+ to store the Client Secret for web/device apps
    # * +YT_API_KEY+ to store the API key for server/browser apps
    #
    # In case both methods are used together,
    # {Yt::Config#configure Yt.configure} takes precedence.
    #
    # @example Set the API client id/secret for a web-client YouTube app:
    #   ENV['YT_CLIENT_ID'] = 'ABCDEFGHIJ1234567890'
    #   ENV['YT_CLIENT_SECRET'] = 'ABCDEFGHIJ1234567890'
    #
    class Configuration
      # @return [String] the Client ID for web/device YouTube applications.
      # @see https://console.developers.google.com Google Developers Console
      attr_accessor :client_id

      # @return [String] the Client Secret for web/device YouTube applications.
      # @see https://console.developers.google.com Google Developers Console
      attr_accessor :client_secret

      # @return [String] the API key for server/browser YouTube applications.
      # @see https://console.developers.google.com Google Developers Console
      attr_accessor :api_key

      # Initialize the global configuration settings, using the values of
      # the specified following environment variables by default.
      def initialize
        @client_id = ENV['YT_CLIENT_ID']
        @client_secret = ENV['YT_CLIENT_SECRET']
        @api_key = ENV['YT_API_KEY']
      end
    end
  end
end