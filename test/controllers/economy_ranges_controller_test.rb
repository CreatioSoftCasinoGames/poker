require 'test_helper'

class EconomyRangesControllerTest < ActionController::TestCase
  setup do
    @economy_range = economy_ranges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:economy_ranges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create economy_range" do
    assert_difference('EconomyRange.count') do
      post :create, economy_range: { level: @economy_range.level, lower_limit: @economy_range.lower_limit, upper_limit: @economy_range.upper_limit }
    end

    assert_redirected_to economy_range_path(assigns(:economy_range))
  end

  test "should show economy_range" do
    get :show, id: @economy_range
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @economy_range
    assert_response :success
  end

  test "should update economy_range" do
    patch :update, id: @economy_range, economy_range: { level: @economy_range.level, lower_limit: @economy_range.lower_limit, upper_limit: @economy_range.upper_limit }
    assert_redirected_to economy_range_path(assigns(:economy_range))
  end

  test "should destroy economy_range" do
    assert_difference('EconomyRange.count', -1) do
      delete :destroy, id: @economy_range
    end

    assert_redirected_to economy_ranges_path
  end
end
