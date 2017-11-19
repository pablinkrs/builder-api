require 'test_helper'

class PerfilsControllerTest < ActionController::TestCase
  setup do
    @perfil = perfils(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:perfils)
  end

  test "should create perfil" do
    assert_difference('Perfil.count') do
      post :create, perfil: { nombre: @perfil.nombre, nombrecorto: @perfil.nombrecorto }
    end

    assert_response 201
  end

  test "should show perfil" do
    get :show, id: @perfil
    assert_response :success
  end

  test "should update perfil" do
    put :update, id: @perfil, perfil: { nombre: @perfil.nombre, nombrecorto: @perfil.nombrecorto }
    assert_response 204
  end

  test "should destroy perfil" do
    assert_difference('Perfil.count', -1) do
      delete :destroy, id: @perfil
    end

    assert_response 204
  end
end
