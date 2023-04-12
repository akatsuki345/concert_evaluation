class Public::ConcertsController < ApplicationController
  before_action :set_categories


  def index
    if params[:category_id].present?
      @concerts = Concert.search_category(params[:category_id]).page(params[:page]).per(8)
      @title = params[:category_name]
      @add_concerts_title = @concerts.first.name if @concerts.present?
    else
      @concerts = Concert.page(params[:page]).per(8)
    end
  end

  def show
    @concert = Concert.find(params[:id])
    @cart = CartItem.new
    @revues = @concert.revues.page(params[:page]).per(8)
    @revue = Revue.new
  end

  private
    def set_categories
      @categories = Category.all
    end

end
