require 'test_helper'

class EscritoriosControllerTest < ActionController::TestCase
  setup do
    @escritorio = escritorios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:escritorios)
  end

  test "should create escritorio" do
    assert_difference('Escritorio.count') do
      post :create, escritorio: { fecha: @escritorio.fecha, nombre: @escritorio.nombre }
    end

    assert_response 201
  end

  test "should show escritorio" do
    get :show, id: @escritorio
    assert_response :success
  end

  test "should update escritorio" do
    put :update, id: @escritorio, escritorio: { fecha: @escritorio.fecha, nombre: @escritorio.nombre }
    assert_response 204
  end

  test "should destroy escritorio" do
    assert_difference('Escritorio.count', -1) do
      delete :destroy, id: @escritorio
    end

    assert_response 204
  end
end
