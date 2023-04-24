class HomeController < ApplicationController

  def index
    if user_signed_in?
      @user = current_user
      redirect_to matelists_url
    end
  end


end
