class Public::HomeController < ApplicationController
  def top
    @categories = Category.all
    @concerts = Concert.status_public.order('id DESC').limit(4)
  end

  def about
  end
end
