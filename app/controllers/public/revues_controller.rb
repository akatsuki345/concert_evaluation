class Public::RevuesController < ApplicationController

  # def index
  #   @revues = Revue.all.page(params[:page]).per(10)
  #   @revue = Revue.new
  #   # @concert = Concert.find(params[:concert_id])
  #   # @revue = Revue.new(revue_params)
  #   # @revue.customer_id = current_customer.id
  #   # @revue.concert_id = concert.id
  #   # @revue.save
  #   # redirect_to public_concert_path(concert)
  # end

  def edit
    @revue = Revue.find(params[:id])
    if @revue.customer_id == current_user.id
    else redirect_to concert_path(@revue.concert.id)
      # URLを直接書いた場合でも入れない様に記述
    end
    @search = Concert.ransack(params[:q])
    @results = @search.result.order("name").page(params[:page]).per(10)
  end

  def show
    @revue = Revue.find(params[:id])
    @revue = Revue.new
    @comment = Comment.new
    @concert = @revue.concert
    @customer = @revue.customer
    @search = Concert.ransack(params[:q])
    @results = @search.result.order("name").page(params[:page]).per(10)
  end

  def create
    concert = Concert.find(params[:concert_id])
    revue = Revue.new(revue_params)
    revue.customer_id = current_customer.id
    revue.concert_id = concert.id
    revue.save
    redirect_to public_concert_path(concert)
  end

  def update
    @revue = Revue.find(params[:id])
    @search = Concert.ransack(params[:q])
    @results = @search.result.order("name").page(params[:page]).per(10)
    if @revue.update(revue_params)
       redirect_to concert_revue_path(@revue.id)
    else
       render "edit"
    end
  end

  def destroy
    @revue = Revue.find(params[:id])
    @concert = Concert.find(params[:concert_id])
    @revue.destroy
    redirect_to concert_path(@concert)
  end

  private
    def revue_params
      params.require(:revue).permit(:impressions, :star)
    end
end
