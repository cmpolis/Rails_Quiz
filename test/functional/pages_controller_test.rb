require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  
  test "Root url gives pages#home" do
    assert_generates "/", :controller => "pages", :action => "home"
  end

end
