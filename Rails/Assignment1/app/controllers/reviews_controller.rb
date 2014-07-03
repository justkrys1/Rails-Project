class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # POST /reviews
  # POST /reviews.json
  def create
    @product = Product.find(params[ :product_id])
    @review = @product.reviews.new( review_params )

    respond_to do |format|
      if @review.save
        format.html { redirect_to store_show_path( @product ), notice: 'Review was successfully created.' }
        format.json { render action: 'show', status: :created, location: @review }
      else
        format.html { redirect_to store_show_path( @product ), notice: 'Review was NOT successfully created.' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to product_path(@review.product_id ) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:name, :content, :rating, :product_id)
    end
end
