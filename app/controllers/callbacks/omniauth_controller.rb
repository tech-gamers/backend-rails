module Callbacks
  class OmniauthController < Devise::OmniauthCallbacksController
    def github
      @auth = Auth.from_github(request.env['omniauth.auth'])
      sign_in_and_redirect(@auth)
    end
  end
end
