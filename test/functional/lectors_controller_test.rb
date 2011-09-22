# -*- encoding : utf-8 -*-
require 'test_helper'

class LectorsControllerTest < ActionController::TestCase
  setup do
    @lector = lectors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lectors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lector" do
    assert_difference('Lector.count') do
      post :create, lector: @lector.attributes
    end

    assert_redirected_to lector_path(assigns(:lector))
  end

  test "should show lector" do
    get :show, id: @lector.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lector.to_param
    assert_response :success
  end

  test "should update lector" do
    put :update, id: @lector.to_param, lector: @lector.attributes
    assert_redirected_to lector_path(assigns(:lector))
  end

  test "should destroy lector" do
    assert_difference('Lector.count', -1) do
      delete :destroy, id: @lector.to_param
    end

    assert_redirected_to lectors_path
  end
end
