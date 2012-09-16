require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class AppDotNet < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://alpha-api.app.net/',
        :authorize_url => 'https://alpha.app.net/oauth/authenticate',
        :token_url => 'https://alpha.app.net/oauth/access_token'
      }

      def request_phase
        super
      end

      uid { user_data['id'] }

      info do
        # these fields will probably change rapidly as App.net api evolves
        {
          'name' => user_data['name'],
          'nickname' => user_data['username'],
          'image' => (user_data['avatar_image'] ? user_data['avatar_image']["url"] : nil),
          'cover' => (user_data['cover_image'] ? user_data['cover_image']["url"] : nil),
          'human' => user_data['type'] == "human",
          'timezone' => user_data['timezone'],
          'urls' => {
            'Profile' => "https://alpha.app.net/#{user_data['username']}"
          },
        }
      end

      def user_data
        @user_data ||= begin
          access_token.get("/stream/0/users/me").parsed
        end
      end

    end
  end
end

OmniAuth.config.add_camelization 'appdotnet', 'AppDotNet'
