# frozen_string_literal: true

# Properties controller
class PropertiesController < ApplicationController
  before_action :set_property, only: %i[update destroy]

  # GET /properties -> to get a default response
  # GET /properties?name=true&description=true&rental_price=true&status=true&tenant_name=true&tenant_email=true&tenant_phone=true&tenant_availability=true -> to get a specific attributes response
  def index
    values = params_values(params)
    @properties = Property.published.obtain_values(values)

    render json: @properties.to_json
  end

  # GET /properties/1 -> to get a default response
  # GET /properties/1?description=true&tenant_email=true -> to get a specific attributes response
  def show
    values = params_values(params)
    @property = Property.where(id: params[:id]).published.obtain_values(values)

    if @property
      render json: @property.to_json
    else
      render status: :not_found
    end
  end

  # POST /properties
  def create
    @property = Property.new(property_params)

    if @property.save
      render json: @property, status: :created, location: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /properties/1
  def update
    if @property.update(property_params)
      render json: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # DELETE /properties/1
  def destroy
    if @property.destroy
      head :no_content
    else
      render status: :unprocessable_entity
    end
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(
      :name,
      :description,
      :rental_price,
      :status,
      :tenant_name,
      :tenant_email,
      :tenant_phone,
      :tenant_availability
    )
  end

  def params_values(params)
    values = %i[id name status] # Default values to return

    params.each do |param|
      values.push(param[0].to_sym) if param[1] == 'true'
    end

    values.to_set.to_a
  end
end
