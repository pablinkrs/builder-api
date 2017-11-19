class StatusesController < ApplicationController
  before_action :set_status, only: [:show, :update, :destroy]

  def find_all
    @status = Status.all
    render json: @status
  end

end
