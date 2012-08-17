require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class AppDotNet < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://alpha.app.net/',
        :authorize_url => 'https://alpha.app.net/oauth/authenticate',
        :token_url => 'https://alpha.app.net/oauth/access_token'
      }

      def request_phase
        super
      end

      uid { user_data['id'] }

      info do
        {
          'email' => user_data['email'],
          'name' => user_data['name'],
          'image' => user_data['image'],
          'urls' => {
            # todo: replace these
            'AppDotNet' => user_data['app_dot_net_url'],
            'Website' => user_data['online_bio_url']
          },
        }
      end

      def user_data
        access_token.options[:mode] = :query
        user_data ||= access_token.get('/1/me').parsed
      end

    end
  end
end

OmniAuth.config.add_camelization 'appdotnet', 'AppDotNet'
