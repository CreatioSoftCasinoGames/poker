require 'test_helper'

class EconomyBetsControllerTest < ActionController::TestCase
  setup do
    @economy_bet = economy_bets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:economy_bets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create economy_bet" do
    assert_difference('EconomyBet.count') do
      post :create, economy_bet: { lower_limit: @economy_bet.lower_limit, points: @economy_bet.points, upper_limit: @economy_bet.upper_limit }
    end

    assert_redirected_to economy_bet_path(assigns(:economy_bet))
  end

  test "should show economy_bet" do
    get :show, id: @economy_bet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @economy_bet
    assert_response :success
  end

  test "should update economy_bet" do
    patch :update, id: @economy_bet, economy_bet: { lower_limit: @economy_bet.lower_limit, points: @economy_bet.points, upper_limit: @economy_bet.upper_limit }
    assert_redirected_to economy_bet_path(assigns(:economy_bet))
  end

  test "should destroy economy_bet" do
    assert_difference('EconomyBet.count', -1) do
      delete :destroy, id: @economy_bet
    end

    assert_redirected_to economy_bets_path
  end
end
