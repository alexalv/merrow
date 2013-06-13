require 'test_helper'

class OsImagesControllerTest < ActionController::TestCase
  setup do
    @os_image = os_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:os_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create os_image" do
    assert_difference('OsImage.count') do
      post :create, os_image: { description: @os_image.description, file: @os_image.file, system: @os_image.system }
    end

    assert_redirected_to os_image_path(assigns(:os_image))
  end

  test "should show os_image" do
    get :show, id: @os_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @os_image
    assert_response :success
  end

  test "should update os_image" do
    put :update, id: @os_image, os_image: { description: @os_image.description, file: @os_image.file, system: @os_image.system }
    assert_redirected_to os_image_path(assigns(:os_image))
  end

  test "should destroy os_image" do
    assert_difference('OsImage.count', -1) do
      delete :destroy, id: @os_image
    end

    assert_redirected_to os_images_path
  end
end
