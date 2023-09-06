require "application_system_test_case"

class LogUsersTest < ApplicationSystemTestCase
  test "log in a user" do
    OmniAuth.config.test_mode = true
    
    auth_data = {
      uid: '12345', 
      info: { email: 'test@example.com', name: 'John Doe' }, 
      credentials: { token: 'ghu_1eX0SEMtRA66t0d7UHtktZ8LkzcPiI2MRls5' }
    }

    OmniAuth.config.add_mock(:github, **auth_data)

    visit new_session_path

    click_button "Login with GitHub"

    assert_current_path '/welcome.html'

    user = User.last

    assert_equal 'John Doe', user.name
    assert_equal '12345', user.github_uid
    assert_equal 'test@example.com', user.email
  end
end
