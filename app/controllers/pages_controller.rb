class PagesController < ApplicationController
  def home
    if current_user
      redirect_to current_user
    end
  end

  def sign_in; end

  def sign_up; end
end
