class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author = User.find(current_user.id)
    if @comment.save
      render :show, layout: false
    else
      @error = @comment.errors
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
