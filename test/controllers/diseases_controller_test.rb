require 'test_helper'

class DiseasesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get diseases_show_url
    assert_response :success
  end

end
