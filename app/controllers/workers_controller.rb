class WorkersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :destroy]

  def index
    @workers = Worker.includes(:user)
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(worker_params)
    if @worker.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @worker = Worker.find(params[:id])
    #@comment = Comment.new
    #@comments = @prototype.comments
  end

  def edit
    @worker = Worker.find(params[:id])
  end

  def update
    @worker = Worker.find(params[:id])
    if @worker.update(worker_params)
      redirect_to worker_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    worker = Worker.find(params[:id])
    worker.destroy
    redirect_to root_path
  end

  private
  def worker_params
    params.require(:worker).permit(:title, :catch_copy, :pt_name, :image).merge(user_id: current_user.id)
  end
end
