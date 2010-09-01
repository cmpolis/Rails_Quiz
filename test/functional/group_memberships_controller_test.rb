require 'test_helper'

class GroupMembershipsControllerTest < ActionController::TestCase

  test "Must be logged in to join a group" do
    @controller.current_user = nil
    post :create, { :group_id => 1 }
    assert_equal "Must be logged in to join a group", flash[:notice]
    assert_redirected_to root_url
  end
  
  test "create makes a group, flashes confirmation, redirects" do
    @controller.current_user = Factory(:user)
    Factory(:group) # build group w/ id: 1
    assert_difference('GroupMembership.count') do
      post :create, { :group_id => 1 }
    end
    # assert flash
    # redirect to confirmation page, group page, referer or root!?....
    # assert_redirected_to :controller => "groups", :action => "show", :id => GroupMembership.last.group_id
  end

  test "must not be able to join group you are already a member of" do
    @controller.current_user = Factory(:user)
    group = Factory(:group)
    
    post :create, { :group_id => 1 }
    assert_no_difference('GroupMembership.count') do
      post :create, { :group_id => 1 }
    end
    assert_equal "Already a member of #{group.name}", flash[:notice]
  end

end
