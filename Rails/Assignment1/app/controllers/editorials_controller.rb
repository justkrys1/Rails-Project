class EditorialsController < ApplicationController
  before_action :set_editorial, only: [:show, :edit, :update, :destroy, :mail, :spam, :newsletter]


  def mail
    UserMailer.newsletter(@editorial, current_user).deliver
    redirect_to @editorial, notice: 'Email was sent.'
  end

  def spam
    #users = User.all
    users = User.where(:newsletter => true)
    users.each do |user|
      UserMailer.newsletter(@editorial, user).deliver
    end
    redirect_to editorials_path, notice: 'Email was sent.'
  end

  # GET /editorials
  # GET /editorials.json
  def index
    #@editorials = Editorial.all
    @page = params[ 'page']
    @editorials = Editorial.page(@page).order( :updated_at => :desc )
  end

  # GET /editorials/1
  # GET /editorials/1.json
  def show
  end

  # GET /editorials/new
  def new
    @editorial = Editorial.new
  end

  # GET /editorials/1/edit
  def edit
  end

  # POST /editorials
  # POST /editorials.json

  def create
    @editorial = Editorial.new(editorial_params)
    users = User.where(:newsletter => true)
    respond_to do |format|
      if @editorial.save
        users.each do |user|
        UserMailer.newsletter(@editorial, user.email).deliver
      end
        format.html { redirect_to @editorial, notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @editorial }
      else
        format.html { render action: 'new' }
        format.json { render json: @editorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /editorials/1
  # PATCH/PUT /editorials/1.json
  def update
    respond_to do |format|
      if @editorial.update(editorial_params)
        format.html { redirect_to @editorial, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @editorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /editorials/1
  # DELETE /editorials/1.json
  def destroy
    @editorial.destroy
    respond_to do |format|
      format.html { redirect_to editorials_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_editorial
    @editorial = Editorial.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def editorial_params
    params.require(:editorial).permit(:title, :author, :date, :published, :content, :image)
  end
end
