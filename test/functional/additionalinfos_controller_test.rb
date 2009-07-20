require 'test_helper'

class AdditionalinfosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:additionalinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create additionalinfo" do
    assert_difference('Additionalinfo.count') do
      post :create, :additionalinfo => { }
    end

    assert_redirected_to additionalinfo_path(assigns(:additionalinfo))
  end

  test "should show additionalinfo" do
    get :show, :id => additionalinfos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => additionalinfos(:one).to_param
    assert_response :success
  end

  test "should update additionalinfo" do
    put :update, :id => additionalinfos(:one).to_param, :additionalinfo => { }
    assert_redirected_to additionalinfo_path(assigns(:additionalinfo))
  end

  test "should destroy additionalinfo" do
    assert_difference('Additionalinfo.count', -1) do
      delete :destroy, :id => additionalinfos(:one).to_param
    end

    assert_redirected_to additionalinfos_path
  end
end
