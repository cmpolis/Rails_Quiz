require 'test_helper'

class GroupsControllerTest < ActionController::TestCase

  test "Can only make quiz if logged in" do
    @controller.current_user = nil
    get :new
    assert_redirected_to root_url
    assert_equal "Must be logged in to make a group", flash[:notice]
  end

  test "If logged in, groups#new renders new form" do
    @controller.current_user = Factory(:user)
    get :new
    assert_template :new
  end

  test "Groups#new makes a group, redirects to group page" do
    @controller.current_user = Factory(:user)
    assert_difference('Group.count') do
      post :create, :group => Factory.attributes_for(:group)
    end
    assert_redirected_to :controller => "groups", :action => "show", :id => Group.last.id
  end

  test "Groups#create renders new form if save fails" do
    @controller.current_user = Factory(:user)
    post :create, :group => nil
    assert_template :new
  end

end
