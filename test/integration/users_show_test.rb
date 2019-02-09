require 'test_helper'

# Tests partly from: https://stackoverflow.com/questions/32211247/railstutorial-integration-tests-for-activated-users

class UsersShowTest < ActionDispatch::IntegrationTest
  def setup
    @unactivated_user = users(:lana)
    @activated_user   = users(:archer)
  end

  test "should redirect to root_url when user not activated" do
    log_in_as(@unactivated_user)
    assert_redirected_to root_url
  end

  test "should not redirect root_url when user is activated" do
    log_in_as(@activated_user)
    assert_redirected_to @activated_user
  end
end
