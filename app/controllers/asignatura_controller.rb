class AsignaturaController < ApplicationController
  def index
    @asignaturas = Asignatura.order
    render json: @asignaturas
  end

  def find_field

    @asignaturas = Asignatura.where(params)
    render json: @asignaturas
  end

  def create
    @asignaturas = Asignatura.create(nombreAsignatura: params["nombreAsignatura"])
  end

  def update
    @asignaturas = Asignatura.find(params[:id])

    if @asignaturas.update({nombreAsignatura: params[:nombreAsignatura]})
      head :no_content
    else
      render json: @asignaturas.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @asignaturas = Asignatura.find(params[:id])

    @asignaturas.delete
  end

end
