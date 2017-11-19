require 'test_helper'

class EntidadesControllerTest < ActionController::TestCase
  setup do
    @entidade = entidades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entidades)
  end

  test "should create entidade" do
    assert_difference('Entidade.count') do
      post :create, entidade: { archivo: @entidade.archivo, fecha_creacion: @entidade.fecha_creacion, nombre: @entidade.nombre, tipo: @entidade.tipo }
    end

    assert_response 201
  end

  test "should show entidade" do
    get :show, id: @entidade
    assert_response :success
  end

  test "should update entidade" do
    put :update, id: @entidade, entidade: { archivo: @entidade.archivo, fecha_creacion: @entidade.fecha_creacion, nombre: @entidade.nombre, tipo: @entidade.tipo }
    assert_response 204
  end

  test "should destroy entidade" do
    assert_difference('Entidade.count', -1) do
      delete :destroy, id: @entidade
    end

    assert_response 204
  end
end
