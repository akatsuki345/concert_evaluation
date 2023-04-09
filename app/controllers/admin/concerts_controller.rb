class Admin::ConcertsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @concert = Concert.page(params[:page])
  end

  def show
    @concert = Concert.find(params[:id])
  end

  def destroy
    @concert = Concert.find(params[:id])
    @concert.destroy
    redirect_to admin_concerts_path, notice: "successfully delete concert!"
  end

  private

  def admin_params
    params.require(:concert).permit(:name, :introduction, :category, :price, :is_active, :image, :category_id)
  end

end
