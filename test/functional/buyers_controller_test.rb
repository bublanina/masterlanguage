# -*- encoding : utf-8 -*-
require 'test_helper'

class BuyersControllerTest < ActionController::TestCase
  setup do
    @buyer = buyers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:buyers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create buyer" do
    assert_difference('Buyer.count') do
      post :create, buyer: @buyer.attributes
    end

    assert_redirected_to buyer_path(assigns(:buyer))
  end

  test "should show buyer" do
    get :show, id: @buyer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @buyer.to_param
    assert_response :success
  end

  test "should update buyer" do
    put :update, id: @buyer.to_param, buyer: @buyer.attributes
    assert_redirected_to buyer_path(assigns(:buyer))
  end

  test "should destroy buyer" do
    assert_difference('Buyer.count', -1) do
      delete :destroy, id: @buyer.to_param
    end

    assert_redirected_to buyers_path
  end
end
