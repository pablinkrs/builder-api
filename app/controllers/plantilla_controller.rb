class PlantillaController < ApplicationController
  def index
    @plantillas = Plantilla.order
    render json: @plantillas
  end

  def find_field
    @plantillas = Plantilla.where(params)
    render json: @plantillas
  end

end
