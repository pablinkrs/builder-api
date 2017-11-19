class ActividadesController < ApplicationController
  # before_action :set_actividade, only: [:show, :update, :destroy]

  def create
    datos = {}
    correlativo = Actividade.where({status: 0}).count + 1
    datos["nombre"] = "Actividad #{correlativo.to_s}"
    if params["datos"]["institucion_id"]
      datos["institucion_id"] = params["datos"]["institucion_id"]
    end
    if params["datos"]["docente_id"]
      datos["docente_id"] = params["datos"]["docente_id"]
    end
    if params["datos"]["nivel_id"]
      datos["nivel_id"] = params["datos"]["nivel_id"]
    end
    if params["datos"]["asignatura_id"]
      datos["asignatura_id"] = params["datos"]["asignatura_id"]
    end
    if params["datos"]["status"]
      datos["status"] = params["datos"]["status"]
    end
    if params["datos"]["nombre"]
      datos["nombre"] = params["datos"]["nombre"]
    end
    @actividades = Actividade.create(datos)
    render json: @actividades
  end

  def update
    datos = {}
    if params["datos"]["nombre"]
      datos["nombre"] = params["datos"]["nombre"]
    end
    @actividades = Actividade.find(params["datos"]["id"])
    @actividades.update(datos)
    render json: @actividades
  end

  def index
    @actividades = Actividade.order
    render json: @actividades
  end
  def find_field
    @actividades = Actividade.where(params["datos"])
    render json: @actividades
  end
  def delete
    @actividades = Actividade.find(params["datos"])
    @actividades.delete()
    render json: @actividades
  end
end
