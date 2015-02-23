require 'test_helper'

class RewardAndLevelsControllerTest < ActionController::TestCase
  setup do
    @reward_and_level = reward_and_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reward_and_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reward_and_level" do
    assert_difference('RewardAndLevel.count') do
      post :create, reward_and_level: { level: @reward_and_level.level, lower_limit: @reward_and_level.lower_limit, reward: @reward_and_level.reward, upper_limit: @reward_and_level.upper_limit }
    end

    assert_redirected_to reward_and_level_path(assigns(:reward_and_level))
  end

  test "should show reward_and_level" do
    get :show, id: @reward_and_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reward_and_level
    assert_response :success
  end

  test "should update reward_and_level" do
    patch :update, id: @reward_and_level, reward_and_level: { level: @reward_and_level.level, lower_limit: @reward_and_level.lower_limit, reward: @reward_and_level.reward, upper_limit: @reward_and_level.upper_limit }
    assert_redirected_to reward_and_level_path(assigns(:reward_and_level))
  end

  test "should destroy reward_and_level" do
    assert_difference('RewardAndLevel.count', -1) do
      delete :destroy, id: @reward_and_level
    end

    assert_redirected_to reward_and_levels_path
  end
end
