class MultimediaController < ApplicationController

    def index
      @multimedias = Multimedia.order
      render json: @multimedias
    end

    def find_id
      @multimedias = Multimedia.find(params["id"])
      render json: @multimedias
    end

    def find_field
      datos = params[:datos]
      p datos["tipo"]
      p datos["user"]
      @multimedias = Multimedia.where({tipo: datos["tipo"],user_id: datos["user"]})
      @multimedias.each{|lr| p lr}
      render json: @multimedias
    end

    def create
      datos = params["datos"]
      @multimedias = Multimedia.create({nombre: datos[:nombre], ruta: datos[:ruta],tipo: datos[:tipo], user_id: datos[:user], primera: datos[:primera]})
    end

    def update
      @multimedias = Multimedia.find(params[:id])

      if @multimedias.update(params[:datos])
        head :no_content
      else
        render json: @multimedias.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @multimedias = Multimedia.find(params[:id])

      @multimedias.delete
    end
  end
