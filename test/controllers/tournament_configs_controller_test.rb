require 'test_helper'

class TournamentConfigsControllerTest < ActionController::TestCase
  setup do
    @tournament_config = tournament_configs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tournament_configs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tournament_config" do
    assert_difference('TournamentConfig.count') do
      post :create, tournament_config: { days: @tournament_config.days, end_date: @tournament_config.end_date, period: @tournament_config.period, start_date: @tournament_config.start_date }
    end

    assert_redirected_to tournament_config_path(assigns(:tournament_config))
  end

  test "should show tournament_config" do
    get :show, id: @tournament_config
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tournament_config
    assert_response :success
  end

  test "should update tournament_config" do
    patch :update, id: @tournament_config, tournament_config: { days: @tournament_config.days, end_date: @tournament_config.end_date, period: @tournament_config.period, start_date: @tournament_config.start_date }
    assert_redirected_to tournament_config_path(assigns(:tournament_config))
  end

  test "should destroy tournament_config" do
    assert_difference('TournamentConfig.count', -1) do
      delete :destroy, id: @tournament_config
    end

    assert_redirected_to tournament_configs_path
  end
end
