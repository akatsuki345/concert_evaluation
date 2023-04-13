class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

   def search
     @range = params[:range]
     if @range == "Customer"
        @customers = Customer.looks(params[:search], params[:word])
      render "public/searches/search_results"
     else
        @concerts = Concert.looks(params[:search], params[:word])
      render "public/searches/search_result"
     end
   end
end
