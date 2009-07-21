module AuthenticatedTestHelper
  # Sets the current test_user in the session from the test_user fixtures.
  def login_as(test_user)
    @request.session[:test_user_id] = test_user ? (test_user.is_a?(TestUser) ? test_user.id : test_users(test_user).id) : nil
  end

  def authorize_as(test_user)
    @request.env["HTTP_AUTHORIZATION"] = test_user ? ActionController::HttpAuthentication::Basic.encode_credentials(test_users(test_user).login, 'monkey') : nil
  end
  
end
