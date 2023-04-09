class Public::ConcertsController < ApplicationController
  before_action :set_categories
  before_action :authenticate_public!


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
  end

  def new
    @concert = Concert.new
  end

  def create
       @concert = Concert.new(public_params)
         if @concert.save
            redirect_to public_concert_path(@concert), notice: "You have created concert successfully."
         else
            render :new
         end
  end

  def confirm
  end

  def complete
  end


  def edit
    @concert = Concert.find(params[:id])
  end

  def update
        @concert = Concert.find(params[:id])
        if @concert.update(public_params)
            redirect_to public_concert_path(@concert), notice: "You have updated concert successfully."
        else
            render :edit
        end
  end

  private
    def set_categories
      @categories = Category.all
    end

    def public_params
      params.require(:concert).permit(:name, :introduction, :category, :price, :is_active, :image, :category_id)
    end
end
