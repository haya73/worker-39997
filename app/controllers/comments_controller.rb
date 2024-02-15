class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to worker_path(@comment.worker) 
    else
      @worker = @comment.worker
      @comments = @worker.comments
      render "workers/show" 
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :content_title).merge(user_id: current_user.id, worker_id: params[:worker_id])
  end
end
