class PagesController < ApplicationController
  def home
    if current_auth
      redirect_to current_auth.user
    end
  end

  def sign_in; end

  def sign_up; end
end
