require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  
  test "categories#show should redirect if invalid id is given" do
    get :show, { :id => nil }
    assert_redirected_to root_url
    get :show, { :id => 82034 }
    assert_redirected_to root_url
  end

  test "categories#show should render show if id is valid" do
    cat = Factory(:category)
    get :show, { :id => cat.id }
    assert_template :show
  end
end
