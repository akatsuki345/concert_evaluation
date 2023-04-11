class Admin::ConcertsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @concert = Concert.page(params[:page])
  end

  def new
    @concert = Concert.new
  end

  def create
         @concert = Concert.new(admin_params)
      if @concert.save
        redirect_to admin_concert_path(@concert), notice: "You have created concert successfully."
      else
       render :new
      end
  end

  def show
    @concert = Concert.find(params[:id])
  end

  def edit
    @concert = Concert.find(params[:id])
  end

  def update
          @concert = Concert.find(params[:id])
      if @concert.update(admin_params)
        redirect_to admin_concert_path(@concert), notice: "You have updated item successfully."
      else
        render :edit
      end
  end

  def destroy
    @concert = Concert.find(params[:id])
    @concert.destroy
    redirect_to admin_concerts_path, notice: "successfully delete concert!"
  end

  private

  def admin_params
    params.require(:concert).permit(:image, :is_active, :name, :introduction, :category, :category_id, :price)
  end

end
