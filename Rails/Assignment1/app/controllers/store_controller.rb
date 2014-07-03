class StoreController < ApplicationController
  before_filter :authenticate, except: [ :index, :show ]
  def index
    #@page1 = params[ 'page']
    @products = Product.page(@page1).order( :updated_at => :desc )
  end

  def show
    @review = Review.new
     @product = Product.find( params[ :id ])
  end
end
