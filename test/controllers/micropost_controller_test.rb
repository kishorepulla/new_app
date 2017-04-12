require 'test_helper'

class MicropostControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get micropost_new_url
    assert_response :success
  end

  test "should get show" do
    get micropost_show_url
    assert_response :success
  end

  test "should get edit" do
    get micropost_edit_url
    assert_response :success
  end

end
