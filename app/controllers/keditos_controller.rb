class KeditosController < ApplicationController
  before_action :set_kedito, only: [:show, :update, :destroy]

  # GET /keditos
  # GET /keditos.json
  def index
    @keditos = Kedito.all

    render json: @keditos
  end

  # GET /keditos/1
  # GET /keditos/1.json
  def show
    render json: @kedito
  end

  # POST /keditos
  # POST /keditos.json
  def create
    @kedito = Kedito.new(kedito_params)

    if @kedito.save
      render json: @kedito, status: :created, location: @kedito
    else
      render json: @kedito.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /keditos/1
  # PATCH/PUT /keditos/1.json
  def update
    @kedito = Kedito.find(params[:id])

    if @kedito.update(kedito_params)
      head :no_content
    else
      render json: @kedito.errors, status: :unprocessable_entity
    end
  end

  # DELETE /keditos/1
  # DELETE /keditos/1.json
  def destroy
    @kedito.destroy

    head :no_content
  end

  private

    def set_kedito
      @kedito = Kedito.find(params[:id])
    end

    def kedito_params
      params.require(:kedito).permit(:nombre, :telefono)
    end
end
