class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    users = User.all
    render json: { data: users }
  end
end
