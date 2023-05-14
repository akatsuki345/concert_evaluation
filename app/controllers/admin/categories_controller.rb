class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "カテゴリーを追加しました！"
      redirect_back(fallback_location: admin_categories_path)
    else
      @categories = Category.all
      render :index
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "カテゴリーを更新しました！"
      redirect_to admin_categories_path(@category.id)
    else
      @categories = Category.all
      render :index
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
