class PerfilsController < ApplicationController

    def index
      @perfiles = Perfil.order
      render json: @perfiles
    end

    def find_field
      @perfiles = Perfil.where(params)
      render json: @perfiles
    end

    def create
      @perfiles = Perfil.create(params)
    end

    def update
      @perfiles = Perfil.find(params[:id])

      if @perfiles.update(params[:datos])
        head :no_content
      else
        render json: @perfiles.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @perfiles = Perfil.find(params[:id])

      @perfiles.delete
    end
  end
