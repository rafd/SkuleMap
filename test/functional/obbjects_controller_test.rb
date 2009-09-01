require 'test_helper'

class ObbjectsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:obbjects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create obbject" do
    assert_difference('Obbject.count') do
      post :create, :obbject => { }
    end

    assert_redirected_to obbject_path(assigns(:obbject))
  end

  test "should show obbject" do
    get :show, :id => obbjects(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => obbjects(:one).to_param
    assert_response :success
  end

  test "should update obbject" do
    put :update, :id => obbjects(:one).to_param, :obbject => { }
    assert_redirected_to obbject_path(assigns(:obbject))
  end

  test "should destroy obbject" do
    assert_difference('Obbject.count', -1) do
      delete :destroy, :id => obbjects(:one).to_param
    end

    assert_redirected_to obbjects_path
  end
end
