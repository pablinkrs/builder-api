require 'test_helper'

class ActividadesControllerTest < ActionController::TestCase
  setup do
    @actividade = actividades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:actividades)
  end

  test "should create actividade" do
    assert_difference('Actividade.count') do
      post :create, actividade: { fecha: @actividade.fecha, nombre: @actividade.nombre }
    end

    assert_response 201
  end

  test "should show actividade" do
    get :show, id: @actividade
    assert_response :success
  end

  test "should update actividade" do
    put :update, id: @actividade, actividade: { fecha: @actividade.fecha, nombre: @actividade.nombre }
    assert_response 204
  end

  test "should destroy actividade" do
    assert_difference('Actividade.count', -1) do
      delete :destroy, id: @actividade
    end

    assert_response 204
  end
end
