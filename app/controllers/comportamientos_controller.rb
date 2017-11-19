class ComportamientosController < ApplicationController
  before_action :set_comportamiento, only: [:show, :update, :destroy]

  def find_all
    @status = Comportamiento.all
    render json: @status
  end

end
