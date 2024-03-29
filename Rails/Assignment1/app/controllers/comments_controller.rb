class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # POST /comments
  # POST /comments.json
  def create
    @blog = Blog.find(params[ :blog_id])
    @comment = @blog.comments.new( comment_params )
    #params[ :author ] = current_user.email.split("@").first

    respond_to do |format|
      if @comment.save
        format.html { redirect_to blogs_path( @blog ), notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { redirect_to blogs_path( @blog ), notice: 'Comment was NOT successfully created.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to blogs_path(@comment.blog_id ) }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:author, :content, :image, :rating, :blog_id)
  end
end
