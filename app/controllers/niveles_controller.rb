class NivelesController < ApplicationController
  def index
    @niveles = Niveles.order
    render json: @niveles
  end

  def find_field

    @niveles = Niveles.where(params)
    render json: @niveles
  end

  def create
    @niveles = Niveles.create(nombreNivel: params["nombreNivel"])
    render json: @niveles
  end

  def update
    @niveles = Niveles.find(params[:id])

    if @niveles.update({nombreNivel: params[:nombreNivel]})
      head :no_content
    else
      render json: @niveles.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @niveles = Niveles.find(params[:id])

    @niveles.delete
  end
end
