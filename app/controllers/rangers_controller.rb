class RangersController < ApplicationController
  before_action :set_parks, only: [:new, :create, :edit, :update]
  before_action :set_ranger, only: [:show, :edit, :update, :destroy]

  # GET /rangers
  def index
    @rangers = Ranger.all
  end

  # GET /rangers/1
  def show
  end

  # GET /rangers/new
  def new
    @ranger = Ranger.new
  end

  # GET /rangers/1/edit
  def edit
  end

  # POST /rangers
  def create
    # new ranger is assigned to current_user
    @ranger = Ranger.new(ranger_params)

    if @ranger.save
      redirect_to @ranger, notice: 'Ranger was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /rangers/1
  def update
    if @ranger.update(ranger_params)
      redirect_to @ranger, notice: 'Ranger was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /rangers/1
  def destroy
    @ranger.destroy
    redirect_to rangers_url, notice: 'Ranger was successfully destroyed.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_ranger
      @ranger = Ranger.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ranger_params
      params.require(:ranger).permit(:name, :park_ids => [])
    end

    def set_parks
      @parks = Park.all
    end
end
