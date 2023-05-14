class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @comment = Comment.page(params[:page])
    @concert = Concert.find(params[:concert_id])
  end

  def show
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to admin_concert_comments_path
  end
end
