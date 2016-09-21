class CommentsController < ApplicationController
   before_action :logged_in_user, only: [:create, :destroy]

   def create
    comment = Comment.new(comment_params)
   micropost = comment.micropost
    flash.now[:danger] = "Comment invalid" unless comment.save
    redirect_to micropost
end

  def destroy
    @id = params[:id]
    comment = Comment.find_by(id: @id)
    micropost = comment.micropost
    comment.destroy
    flash.now[:success] = "Comment deleted"
    redirect_to micropost
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :micropost_id)
  end
end

