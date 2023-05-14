class Admin::RevuesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @revue = Revue.page(params[:page])
    @concert = Concert.find(params[:concert_id])
  end

  def show
  end

  def destroy
    Revue.find(params[:id]).destroy
    redirect_to admin_concert_revues_path(params[:concert_id])
  end
end
