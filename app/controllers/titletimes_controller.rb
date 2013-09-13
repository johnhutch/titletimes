class TitletimesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_titletime, only: [:show, :edit, :update, :destroy]

  # GET /titletimes
  # GET /titletimes.json
  def index
    @titletimes = Titletime.all
  end

  # GET /titletimes/1
  # GET /titletimes/1.json
  def show
  end

  # GET /titletimes/new
  def new
    @titletime = Titletime.new
  end

  # GET /titletimes/1/edit
  def edit
  end

  # POST /titletimes
  # POST /titletimes.json
  def create
    @titletime = Titletime.new(titletime_params)

    respond_to do |format|
      if @titletime.save
        format.html { redirect_to @titletime, notice: 'Titletime was successfully created.' }
        format.json { render action: 'show', status: :created, location: @titletime }
      else
        format.html { render action: 'new' }
        format.json { render json: @titletime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /titletimes/1
  # PATCH/PUT /titletimes/1.json
  def update
    respond_to do |format|
      if @titletime.update(titletime_params)
        format.html { redirect_to @titletime, notice: 'Titletime was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @titletime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /titletimes/1
  # DELETE /titletimes/1.json
  def destroy
    @titletime.destroy
    respond_to do |format|
      format.html { redirect_to titletimes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_titletime
      @titletime = Titletime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def titletime_params
      params.require(:titletime).permit(:movie, :hour, :minute, :second, :cheese)
    end
end
