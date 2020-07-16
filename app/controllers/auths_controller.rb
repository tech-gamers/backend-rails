class AuthsController < ApplicationController
  before_action :authenticate_auth!

  def show
    if current_auth.id.to_s == params[:id]
      @auth = current_auth
    else
      flash.alert = "Permission denied"
      redirect_to current_auth
    end
  end
end
