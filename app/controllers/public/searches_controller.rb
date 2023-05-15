class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

   def search
     @range = params[:range]
     if @range == "Customer"
        @customers = Customer.looks(params[:search], params[:word])
      render "public/searches/search_results"
     else
       # params[:word] pops ジャス
       # ①機能
       # params[:word]の中身を配列化するしょりを追加する [pops,ジャス]
       # searches = [pops,ジャズ]
       #@concerts = Concert.looks(params[:search], searches)
        @concerts = Concert.looks(params[:search], params[:word])
      render "public/searches/search_result"
     end
   end
end
