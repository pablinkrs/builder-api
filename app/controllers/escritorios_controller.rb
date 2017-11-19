class EscritoriosController < ApplicationController
  before_action :set_escritorio, only: [:show, :update, :destroy]

  def find_all
    @status = Escritorio.all
    render json: @status
  end
end
