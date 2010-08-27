require 'test_helper'

class QuizzesControllerTest < ActionController::TestCase
  
  test "If not logged in, make quiz redirects to root" do
    @controller.current_user = nil
    get :new
    assert_redirected_to root_url
    assert_equal "Must be logged in to make a quiz", flash[:notice]
  end

  test "If logged in, renders new quiz form" do
    @controller.current_user = Factory(:user)
    get :new
    assert_template :new
  end

end
