require 'test_helper'

class LikesControllerTest < ActionController::TestCase
  
  test "If not logged in, likes#create redirects to quiz page" do
    @controller.current_user = nil
    post :create, :id => 1
    assert_redirected_to Quiz.find(1)
    assert_equal "Must be logged in to like a quiz", flash[:notice]
  end

  test "If logged in, likes#create creates a like for user, quiz" do
    user = Factory(:user)
    @controller.current_user = user
    assert_difference('Like.count') do
      post :create, :id => 1
    end
    assert_not_nil user.likes.find_by_quiz_id 1
    assert_equal "Quiz succesfully liked", flash[:notice]
  end
  
  test "Likes#create must be sent an id" do
    post :create
    assert_equal "Must have a quiz id to like", flash[:notice]
    assert_redirected_to root_url
  end

  test "User can only like a quiz once" do
    @controller.current_user = Factory(:user)
    post :create, :id => 1
    assert_no_difference('Like.count') do
      post :create, :id => 1    
    end
    assert_equal "Can only like a quiz once", flash[:notice]
  end

end
