class Admin::CommentsController < ApplicationController
  def index
    @comment = Comment.page(params[:page])
    @concert = Concert.find(params[:concert_id])
  end

  def show
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to admin_concert_comments_path(params[:concert_id])
  end
end
