require 'test_helper'

class VmconfigsControllerTest < ActionController::TestCase
  setup do
    @vmconfig = vmconfigs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vmconfigs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vmconfig" do
    assert_difference('Vmconfig.count') do
      post :create, vmconfig: { config: @vmconfig.config, description: @vmconfig.description, name: @vmconfig.name }
    end

    assert_redirected_to vmconfig_path(assigns(:vmconfig))
  end

  test "should show vmconfig" do
    get :show, id: @vmconfig
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vmconfig
    assert_response :success
  end

  test "should update vmconfig" do
    put :update, id: @vmconfig, vmconfig: { config: @vmconfig.config, description: @vmconfig.description, name: @vmconfig.name }
    assert_redirected_to vmconfig_path(assigns(:vmconfig))
  end

  test "should destroy vmconfig" do
    assert_difference('Vmconfig.count', -1) do
      delete :destroy, id: @vmconfig
    end

    assert_redirected_to vmconfigs_path
  end
end
