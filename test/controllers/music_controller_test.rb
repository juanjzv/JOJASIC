require 'test_helper'

class MusicControllerTest < ActionDispatch::IntegrationTest
  test "should get discover" do
    get music_discover_url
    assert_response :success
  end

  test "should get search" do
    get music_search_url
    assert_response :success
  end

  test "should get list" do
    get music_list_url
    assert_response :success
  end

end
