class HerramientasController < ApplicationController
  def index
    @herramientas = Herramientas.order
    render json: @herramientas
  end

  def find_field
    @herramientas = Herramientas.where(params)
    render json: @herramientas
  end

end
