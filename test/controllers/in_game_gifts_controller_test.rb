require 'test_helper'

class InGameGiftsControllerTest < ActionController::TestCase
  setup do
    @in_game_gift = in_game_gifts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:in_game_gifts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create in_game_gift" do
    assert_difference('InGameGift.count') do
      post :create, in_game_gift: { cost: @in_game_gift.cost, name: @in_game_gift.name }
    end

    assert_redirected_to in_game_gift_path(assigns(:in_game_gift))
  end

  test "should show in_game_gift" do
    get :show, id: @in_game_gift
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @in_game_gift
    assert_response :success
  end

  test "should update in_game_gift" do
    patch :update, id: @in_game_gift, in_game_gift: { cost: @in_game_gift.cost, name: @in_game_gift.name }
    assert_redirected_to in_game_gift_path(assigns(:in_game_gift))
  end

  test "should destroy in_game_gift" do
    assert_difference('InGameGift.count', -1) do
      delete :destroy, id: @in_game_gift
    end

    assert_redirected_to in_game_gifts_path
  end
end
