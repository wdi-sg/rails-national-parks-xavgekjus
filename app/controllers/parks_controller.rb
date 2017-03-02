class ParksController < ApplicationController
  def index
    @parks = Park.all
  end

  def show
    @parks = Park.find(params[:id])
  end
end
