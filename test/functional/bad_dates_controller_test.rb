require 'test_helper'

class BadDatesControllerTest < ActionController::TestCase
  setup do
    @bad_date = bad_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bad_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bad_date" do
    assert_difference('BadDate.count') do
      post :create, bad_date: @bad_date.attributes
    end

    assert_redirected_to bad_date_path(assigns(:bad_date))
  end

  test "should show bad_date" do
    get :show, id: @bad_date.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bad_date.to_param
    assert_response :success
  end

  test "should update bad_date" do
    put :update, id: @bad_date.to_param, bad_date: @bad_date.attributes
    assert_redirected_to bad_date_path(assigns(:bad_date))
  end

  test "should destroy bad_date" do
    assert_difference('BadDate.count', -1) do
      delete :destroy, id: @bad_date.to_param
    end

    assert_redirected_to bad_dates_path
  end
end
