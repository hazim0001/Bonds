class PropertiesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @property = Property.new(property_params)
    authorize @property
    if @property.save
      redirect_to asset_properties_path(@property.asset), notice: "Your property has been created"
    else
      redirect_to asset_properties_path(@property.asset), flash[:alert] = "Something went wrong 😔"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def property_params
    params.require(:property).permit(:description, :value, :asset_id, :location)
  end

  def set_property
    @property = Property.find(params[:id])
  end
end
