class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @pollution_event = PollutionEvent.find(params[:pollution_event_id])
    @comment = Comment.new
  end

  def create
    @pollution_event = PollutionEvent.find(params[:pollution_event_id])
    @comment = Comment.new(comment_params)
    @comment.pollution_event = @pollution_event
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment added successfully"
      redirect_to pollution_event_path(@pollution_event)
    else
      flash.now[:error] = @comment.errors.full_messages.join(", ")
      render :new
    end
  end


  def destroy
  end

  def edit
  end

  def update
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :pollution_event_id, :created_at, :updated_at)
  end
end
