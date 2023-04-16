class Admin::ConcertsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @concert = Concert.page(params[:page])
    @concerts = Concert.all
  end

  def new
    @concert = Concert.new
  end

  def create
    @concert = Concert.new(admin_params)
    @concert.customer_id = Customer.find_by_nickname(params[:concert][:customer_name])&.id
    if @concert.save
      @concert.save_tags(params[:tag].values[0][0].values[0])
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
         @concert.save_tags(params[:tag].values[0][0].values[0])
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
    params.require(:concert).permit(:image, :is_active, :name, :nickname, :introduction, :category, :category_id, :price)
  end

end
