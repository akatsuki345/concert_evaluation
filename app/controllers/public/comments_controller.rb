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
    redirect_to revue_path(revue)
  end

  def update
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
