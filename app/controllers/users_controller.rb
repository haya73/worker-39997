class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @workers = @user.workers
  end
end
