require 'test_helper'

class CagosControllerTest < ActionController::TestCase
  setup do
    @cago = cagos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cagos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cago" do
    assert_difference('Cago.count') do
      post :create, cago: { name: @cago.name, status_id: @cago.status_id }
    end

    assert_redirected_to cago_path(assigns(:cago))
  end

  test "should show cago" do
    get :show, id: @cago
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cago
    assert_response :success
  end

  test "should update cago" do
    put :update, id: @cago, cago: { name: @cago.name, status_id: @cago.status_id }
    assert_redirected_to cago_path(assigns(:cago))
  end

  test "should destroy cago" do
    assert_difference('Cago.count', -1) do
      delete :destroy, id: @cago
    end

    assert_redirected_to cagos_path
  end
end
