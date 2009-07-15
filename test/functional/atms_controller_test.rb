require 'test_helper'

class AtmsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:atms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create atm" do
    assert_difference('Atm.count') do
      post :create, :atm => { }
    end

    assert_redirected_to atm_path(assigns(:atm))
  end

  test "should show atm" do
    get :show, :id => atms(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => atms(:one).to_param
    assert_response :success
  end

  test "should update atm" do
    put :update, :id => atms(:one).to_param, :atm => { }
    assert_redirected_to atm_path(assigns(:atm))
  end

  test "should destroy atm" do
    assert_difference('Atm.count', -1) do
      delete :destroy, :id => atms(:one).to_param
    end

    assert_redirected_to atms_path
  end
end
