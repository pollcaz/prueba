require 'test_helper'

class EstudiantesControllerTest < ActionController::TestCase
  setup do
    @estudiante = estudiantes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estudiantes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estudiante" do
    assert_difference('Estudiante.count') do
      post :create, estudiante: { cedula: @estudiante.cedula, curso_id: @estudiante.curso_id, direccion: @estudiante.direccion, email: @estudiante.email, fch_nacimiento: @estudiante.fch_nacimiento, nombres: @estudiante.nombres }
    end

    assert_redirected_to estudiante_path(assigns(:estudiante))
  end

  test "should show estudiante" do
    get :show, id: @estudiante
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estudiante
    assert_response :success
  end

  test "should update estudiante" do
    put :update, id: @estudiante, estudiante: { cedula: @estudiante.cedula, curso_id: @estudiante.curso_id, direccion: @estudiante.direccion, email: @estudiante.email, fch_nacimiento: @estudiante.fch_nacimiento, nombres: @estudiante.nombres }
    assert_redirected_to estudiante_path(assigns(:estudiante))
  end

  test "should destroy estudiante" do
    assert_difference('Estudiante.count', -1) do
      delete :destroy, id: @estudiante
    end

    assert_redirected_to estudiantes_path
  end
end
