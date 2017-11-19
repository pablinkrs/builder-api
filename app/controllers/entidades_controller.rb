class EntidadesController < ApplicationController
  # before_action :set_entidade, only: [:show, :update, :destroy]

  def create
    datos = params["data"]

    elemAntiguos = []
    entidadNuevo = []
    entidades = []
    indicadorEntidades = 0

    while indicadorEntidades < datos.count do
      data = datos[indicadorEntidades.to_s]
      indicadorEntidades += 1;

      entidadNuevo = {nombre: data["nombre"], tipo: data["tipo"], fecha_creacion: data["fecha_creacion"], idRe: data["idRe"]}

      if data["duplicarArchivos"] != ""
        old = Entidade.find(data["duplicarArchivos"])

        elemAntiguos = {}
        if old[:elementos]
          elemAntiguos["herramientas"] = old[:elementos][:herramientas].map { |e| e }
          if old[:elementos][:imagenes]
            elemAntiguos["imagenes"] = old[:elementos][:imagenes].map { |e| e }
          end
          if old[:elementos][:videos]
            elemAntiguos["imagenes"] = old[:elementos][:videos].map { |e| e }
          end
          if old[:elementos][:audios]
            elemAntiguos["imagenes"] = old[:elementos][:audios].map { |e| e }
          end
          if old[:elementos][:paginas]
            elemAntiguos["imagenes"] = old[:elementos][:paginas].map { |e| e }
          end
          if old[:elementos][:imgAzar]
            elemAntiguos["imagenes"] = old[:elementos][:imgAzar].map { |e| e }
          end
          if old[:elementos][:stylePersonaliazdo]
            elemAntiguos["imagenes"] = old[:elementos][:stylePersonaliazdo].map { |e| e }
          end
          if old[:elementos][:geogebra]
            elemAntiguos["imagenes"] = old[:elementos][:geogebra].map { |e| e }
          end

          elemNuevos = old[:elementos][:herramientas].map { |e| e+"_2" }

          old[:elementos][:herramientas] = elemNuevos

        end
        entidadNuevo = { elementos: old[:elementos], nombre: data[:nombre], tipo: old[:tipo], fecha_creacion: data[:fecha_creacion], idRe: old[:idRe]}

      end

      @entidade = Entidade.create(entidadNuevo)
      @entidade.update({archivo: "hoja_#{@entidade[:id].to_s}.txt"})
      nueva = Entidade.find(@entidade[:id].to_s)
      entidades.push(nueva)
    end
    puts "hola k ace"
    p entidades.to_json
    puts "hola k ace"
    render json: {entidad: entidades, elementosAntiguos: elemAntiguos}

  end

  def destroy
    p params[:data]
    params[:data].each do |ent|
      puts ent
      @entidade = Entidade.find(ent)
      @entidade.delete
    end
    render json: {estado: "ok"}
  end

  def destroy_entidades_re
    datos = params[:entidades]
    datos["entidades"].each do |i|
      entidad = Entidade.find(i)
      puts "Eliminando id nrp: #{i}"
      entidad.delete
    end
    render json: {estado: "ok"}
  end

  def actividadEntidad
    datos = params[:data]
    entidad = Entidade.find(datos[:id])
    if entidad.actividad_id == nil
      actividad = Actividade.create({status: "1"})
      entidad.update({actividad_id: actividad._id})
    end
    render json: {estado: entidad}
  end

  def entidadxid
    datos = params[:data]
    entidad = Entidade.find(datos[:id])
    render json: entidad
  end

  def update
    datos = params
    entidad = Entidade.find(datos[:id])
    if datos[:rutas].is_a?(String)
      entidad.update({archivo: datos[:archivo]})
    else
      # entidad.update({archivo: datos[:archivo], elementos: datos[:rutas]})
      puts "<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>"
      p datos[:elementos_nuevos]
      puts "<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>"
      entidad.update({archivo: datos[:archivo], elementos: datos[:rutas], elementos_nuevos: datos[:elementos_nuevos]})
    end
    # entidad.update({archivo: datos[:archivo], elementos: datos[:rutas]})
    render json: {estado: "ok"}
  end

  def updateDoc
    datos = params
    entidad = Entidade.find(datos[:id])
    entidad.update({docStoryboard: datos[:documentoStoryboard]})
    render json: {estado: "ok"}
  end

end
