module Callbacks
  class OmniauthController < Devise::OmniauthCallbacksController
    def github
      @user = User.from_github(request.env['omniauth.auth'])
      sign_in_and_redirect(@user)
    end
  end
end
