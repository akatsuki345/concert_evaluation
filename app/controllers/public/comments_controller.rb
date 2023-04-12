class Public::CommentsController < ApplicationController
  def index
  end

  def edit
  end

  def create
    revue = Revue.find(params[:revue_id])
    comment = current_customer.comments.new(comment_params)
    comment.revue_id = revue.id
    comment.save
    redirect_to public_concert_path(concert)
  end

  def update
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to public_concert_comments(params[:public_concert_comment_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
