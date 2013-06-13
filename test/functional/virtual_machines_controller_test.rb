require 'test_helper'

class VirtualMachinesControllerTest < ActionController::TestCase
  setup do
    @virtual_machine = virtual_machines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:virtual_machines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create virtual_machine" do
    assert_difference('VirtualMachine.count') do
      post :create, virtual_machine: { config: @virtual_machine.config, description: @virtual_machine.description, macaddr: @virtual_machine.macaddr, name: @virtual_machine.name }
    end

    assert_redirected_to virtual_machine_path(assigns(:virtual_machine))
  end

  test "should show virtual_machine" do
    get :show, id: @virtual_machine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @virtual_machine
    assert_response :success
  end

  test "should update virtual_machine" do
    put :update, id: @virtual_machine, virtual_machine: { config: @virtual_machine.config, description: @virtual_machine.description, macaddr: @virtual_machine.macaddr, name: @virtual_machine.name }
    assert_redirected_to virtual_machine_path(assigns(:virtual_machine))
  end

  test "should destroy virtual_machine" do
    assert_difference('VirtualMachine.count', -1) do
      delete :destroy, id: @virtual_machine
    end

    assert_redirected_to virtual_machines_path
  end
end
