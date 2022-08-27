class PlantsController < ApplicationController
  # GET /plants
  def index
    render json: Plant.all
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    if plant
      render json: plant
    else
      render json: { error: 'Plant not found' }, status: :not_found
    end
  end

  # POST /plants
  def create
    plant = Plant.create(params.permit(:name, :image, :price))
    render json: plant, status: :created
  end
end
