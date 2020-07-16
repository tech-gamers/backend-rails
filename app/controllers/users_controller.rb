class UsersController < ApplicationController
  before_action :authenticate_auth!

  def show
    @user = current_auth.user
    if @user.id.to_s != params[:id]
      flash.alert = "Can't access /users/#{params[:id]}. Permission denied."
      redirect_to current_auth
    end
  end
end
