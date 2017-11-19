require 'test_helper'

class ComportamientosControllerTest < ActionController::TestCase
  setup do
    @comportamiento = comportamientos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comportamientos)
  end

  test "should create comportamiento" do
    assert_difference('Comportamiento.count') do
      post :create, comportamiento: { cantidad: @comportamiento.cantidad, mes: @comportamiento.mes }
    end

    assert_response 201
  end

  test "should show comportamiento" do
    get :show, id: @comportamiento
    assert_response :success
  end

  test "should update comportamiento" do
    put :update, id: @comportamiento, comportamiento: { cantidad: @comportamiento.cantidad, mes: @comportamiento.mes }
    assert_response 204
  end

  test "should destroy comportamiento" do
    assert_difference('Comportamiento.count', -1) do
      delete :destroy, id: @comportamiento
    end

    assert_response 204
  end
end
