require 'test_helper'

class UserDeliveryAddressesControllerTest < ActionController::TestCase
  setup do
    @user_delivery_address = user_delivery_addresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_delivery_addresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_delivery_address" do
    assert_difference('UserDeliveryAddress.count') do
      post :create, user_delivery_address: { address: @user_delivery_address.address, city_id: @user_delivery_address.city_id, district_id: @user_delivery_address.district_id, province_id: @user_delivery_address.province_id, receiver: @user_delivery_address.receiver, telephone: @user_delivery_address.telephone, user_id: @user_delivery_address.user_id }
    end

    assert_redirected_to user_delivery_address_path(assigns(:user_delivery_address))
  end

  test "should show user_delivery_address" do
    get :show, id: @user_delivery_address
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_delivery_address
    assert_response :success
  end

  test "should update user_delivery_address" do
    patch :update, id: @user_delivery_address, user_delivery_address: { address: @user_delivery_address.address, city_id: @user_delivery_address.city_id, district_id: @user_delivery_address.district_id, province_id: @user_delivery_address.province_id, receiver: @user_delivery_address.receiver, telephone: @user_delivery_address.telephone, user_id: @user_delivery_address.user_id }
    assert_redirected_to user_delivery_address_path(assigns(:user_delivery_address))
  end

  test "should destroy user_delivery_address" do
    assert_difference('UserDeliveryAddress.count', -1) do
      delete :destroy, id: @user_delivery_address
    end

    assert_redirected_to user_delivery_addresses_path
  end
end
