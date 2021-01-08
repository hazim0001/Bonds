class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      # sql_query = "model @@ :query OR address @@ :query OR description @@ :query"
      @properties = property.where(sql_query, query: "%#{params[:query]}%")
    else
      @properties = current_user.properties.order(created_at: :desc)
    end
    @total = @properties.sum(:value_cents).round(2)
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
    asset = @property.asset
    authorize @property
    @property.destroy
    redirect_to asset_properties_path(asset), notice: "Your property has been deleted"
  end

  private

  def property_params
    params.require(:property).permit(:description, :value, :asset_id, :location)
  end

  def set_property
    @property = Property.find(params[:id])
  end
end
