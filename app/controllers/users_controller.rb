class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    if current_user.id.to_s == params[:id]
      @user = current_user
    else
      flash.alert = "Permission denied"
      redirect_to current_user
    end
  end
end
