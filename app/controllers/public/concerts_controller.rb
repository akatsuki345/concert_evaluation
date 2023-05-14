class Public::ConcertsController < ApplicationController
  before_action :set_categories


  def index
    if params[:category_id].present?
      @concerts = Concert.status_public.search_category(params[:category_id]).page(params[:page]).per(8)
      @title = params[:category_name]
      @add_concerts_title = @concerts.first.name if @concerts.present?
    elsif params[:tag_name].present?
      @concerts = Concert.status_public.joins(:tags).where("tags.name LIKE ?", "%#{params[:tag_name]}%").distinct.page(params[:page]).per(8)
    else
      @concerts = Concert.status_public.page(params[:page]).per(8)
    end
  end

  def show
    @concert = Concert.status_public.find(params[:id])
    @cart = CartItem.new
    @revues = @concert.revues.page(params[:page]).per(8)
    @revue = Revue.new
  end

  private
    def set_categories
      @categories = Category.all
    end

end
