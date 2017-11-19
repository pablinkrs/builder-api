require 'test_helper'

class KeditosControllerTest < ActionController::TestCase
  setup do
    @kedito = keditos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:keditos)
  end

  test "should create kedito" do
    assert_difference('Kedito.count') do
      post :create, kedito: { nombre: @kedito.nombre, telefono: @kedito.telefono }
    end

    assert_response 201
  end

  test "should show kedito" do
    get :show, id: @kedito
    assert_response :success
  end

  test "should update kedito" do
    put :update, id: @kedito, kedito: { nombre: @kedito.nombre, telefono: @kedito.telefono }
    assert_response 204
  end

  test "should destroy kedito" do
    assert_difference('Kedito.count', -1) do
      delete :destroy, id: @kedito
    end

    assert_response 204
  end
end
