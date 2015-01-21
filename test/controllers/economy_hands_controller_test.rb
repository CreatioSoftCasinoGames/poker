require 'test_helper'

class EconomyHandsControllerTest < ActionController::TestCase
  setup do
    @economy_hand = economy_hands(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:economy_hands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create economy_hand" do
    assert_difference('EconomyHand.count') do
      post :create, economy_hand: { hand_quality: @economy_hand.hand_quality, other_winner_point: @economy_hand.other_winner_point, winner_point: @economy_hand.winner_point }
    end

    assert_redirected_to economy_hand_path(assigns(:economy_hand))
  end

  test "should show economy_hand" do
    get :show, id: @economy_hand
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @economy_hand
    assert_response :success
  end

  test "should update economy_hand" do
    patch :update, id: @economy_hand, economy_hand: { hand_quality: @economy_hand.hand_quality, other_winner_point: @economy_hand.other_winner_point, winner_point: @economy_hand.winner_point }
    assert_redirected_to economy_hand_path(assigns(:economy_hand))
  end

  test "should destroy economy_hand" do
    assert_difference('EconomyHand.count', -1) do
      delete :destroy, id: @economy_hand
    end

    assert_redirected_to economy_hands_path
  end
end
