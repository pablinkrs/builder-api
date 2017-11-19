require 'test_helper'

class ResControllerTest < ActionController::TestCase
  setup do
    @re = res(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:res)
  end

  test "should create re" do
    assert_difference('Re.count') do
      post :create, re: { archivosGenerados: @re.archivosGenerados, asignatura_id: @re.asignatura_id, docente_id: @re.docente_id, estructura: @re.estructura, institucion_id: @re.institucion_id, nivel_id: @re.nivel_id, nombreRe: @re.nombreRe, plantilla_id: @re.plantilla_id, rutaReAssets: @re.rutaReAssets }
    end

    assert_response 201
  end

  test "should show re" do
    get :show, id: @re
    assert_response :success
  end

  test "should update re" do
    put :update, id: @re, re: { archivosGenerados: @re.archivosGenerados, asignatura_id: @re.asignatura_id, docente_id: @re.docente_id, estructura: @re.estructura, institucion_id: @re.institucion_id, nivel_id: @re.nivel_id, nombreRe: @re.nombreRe, plantilla_id: @re.plantilla_id, rutaReAssets: @re.rutaReAssets }
    assert_response 204
  end

  test "should destroy re" do
    assert_difference('Re.count', -1) do
      delete :destroy, id: @re
    end

    assert_response 204
  end
end
