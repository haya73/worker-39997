class WorkersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :destroy]

  def index
    @workers = Worker.includes(:user)
  end

  def new
    @worker = Worker.new
  end

  def create
    binding.pry
    @worker = Worker.new(worker_params)
    if @worker.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end



  private
  def worker_params
    params.require(:worker).permit(:title, :catch_copy, :pt_name, :image).merge(user_id: current_user.id)
  end
end
