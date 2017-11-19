class ResController < ApplicationController
  def index
    @res = Re.order
    render json: @res
  end

  def find_id
    @res = Re.find(params[:id])
    render json: @res
  end

  def find_id_re_plantilla
    @res = Re.find(params[:data][:id])
    render json: @res.plantilla
  end

  def find_field

    @res = Re.where(params["datos"])
    render json: @res
  end

  def create
    datos = params["datos"]
    @res = Re.create({nombreRe: datos["nombreRe"], institucion_id: datos["institucion_id"], docente_id: datos["docente_id"], nivel_id: datos["nivel_id"], asignatura_id: datos["asignatura_id"], plantilla_id: datos["plantilla_id"], herramientas_re: datos["herramientas_re"]})
    @res.update({rutaReAssets: "archivos/#{@res.id.to_s}"})
    render json: @res
  end

  def update
    @res = Re.find(params[:id])
    if @res.update({nombreRe: params[:datos][:nombreRe], plantilla_id: params[:datos][:plantilla_id], herramientas_re: params[:herramientas_re]})
      head :no_content
    else
      render json: @res.errors, status: :unprocessable_entity
    end
  end

  def updateEstructura
    @res = Re.find(params[:id])
    if @res.update(estructura: params[:estructura],incluidos: params[:incluidos])
      if(params[:accion] == "editar")
        params[:entidades].to_json.each do |ent|
          p ent
          unaEntidad = Entidad.find(ent["id"])
          unaEntidad.update({nombre: ent["text"]});
        end
      elsif(params[:accion] == "eliminar")
        params[:entidades].to_json.each do |ent|
          p ent
          unaEntidad = Entidad.find(ent["id"])
          unaEntidad.delete;
        end
      end
      head :no_content
    else
      render json: @res.errors, status: :unprocessable_entity
    end
  end
  def updateReGenerado
    @res = Re.find(params[:id])
    p params
    if @res.update(archivosGenerados: params[:archivosGenerados])
      head :no_content
    else
      render json: @res.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @res = Re.find(params[:id])

    @res.delete
  end

  def find_field_re_generacion
    res = Re.find(params[:id])
    res_plantilla = res.plantilla
    retorno = {:re => res, :plantilla => res_plantilla}
    render json: retorno
  end

  def destroy_re_entidades
    re = Re.find(params[:id])
    re.delete
    entidades = Entidade.where({idRe: params[:id]})
    entidades.each do |entidad|
      entidad.delete
    end
    render json: JSON.parse(re.estructura)
  end

  def updateDoc
    datos = params
    entidad = Re.find(datos[:id])
      entidad.update({docStoryboard: datos[:documentoStoryboard]})
    render json: {estado: "ok"}
  end

end
