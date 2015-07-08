require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get treasureHunties" do
    get :treasureHunties
    assert_response :success
  end

  test "should get collectedInventions" do
    get :collectedInventions
    assert_response :success
  end

  test "should get topPlayers" do
    get :topPlayers
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

end
