require 'test_helper'

class EconomyParticipationsControllerTest < ActionController::TestCase
  setup do
    @economy_participation = economy_participations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:economy_participations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create economy_participation" do
    assert_difference('EconomyParticipation.count') do
      post :create, economy_participation: { lower_limit: @economy_participation.lower_limit, other_winner_points: @economy_participation.other_winner_points, participation_point: @economy_participation.participation_point, stopper: @economy_participation.stopper, upper_limit: @economy_participation.upper_limit, winner_points: @economy_participation.winner_points }
    end

    assert_redirected_to economy_participation_path(assigns(:economy_participation))
  end

  test "should show economy_participation" do
    get :show, id: @economy_participation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @economy_participation
    assert_response :success
  end

  test "should update economy_participation" do
    patch :update, id: @economy_participation, economy_participation: { lower_limit: @economy_participation.lower_limit, other_winner_points: @economy_participation.other_winner_points, participation_point: @economy_participation.participation_point, stopper: @economy_participation.stopper, upper_limit: @economy_participation.upper_limit, winner_points: @economy_participation.winner_points }
    assert_redirected_to economy_participation_path(assigns(:economy_participation))
  end

  test "should destroy economy_participation" do
    assert_difference('EconomyParticipation.count', -1) do
      delete :destroy, id: @economy_participation
    end

    assert_redirected_to economy_participations_path
  end
end
