# frozen_string_literal: true

class UserController
  before_action :authenticate_user!

  def index
    @user = current_user
  end
end
