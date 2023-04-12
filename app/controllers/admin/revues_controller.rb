class Admin::RevuesController < ApplicationController
  def index
    @revue = Revue.page(params[:page])
  end

  def show
  end

  def destroy
    Revue.find(params[:id]).destroy
    redirect_to admin_concert_revues_path(params[:concert_id])
  end
end
