require 'test_helper'

class QuizzesControllerTest < ActionController::TestCase
  
  test "If not logged in, quiz#new redirects to root" do
    @controller.current_user = nil
    get :new
    assert_redirected_to root_url
    assert_equal "Must be logged in to make a quiz", flash[:notice]
  end

  test "If logged in, quiz#new renders new form" do
    @controller.current_user = Factory(:user)
    get :new
    assert_template :new
  end

  test "Quiz#create makes a new quiz, redirects to new question" do
    @controller.current_user = Factory(:user)
    assert_difference('Quiz.count') do
      post :create, :quiz => Factory.attributes_for(:quiz) 
    end
    assert_redirected_to :controller => "questions", :action => "new", :id => Quiz.last.id
  end

  test "Quiz#create renders new form if save fails" do
    @controller.current_user = Factory(:user)
    post :create, :quiz => nil
    assert_template :new
  end

  test "Quiz#create creates taggings for new quiz" do
    @controller.current_user = Factory(:user) 
    tags = "this, that, the other thing"
    assert_difference('Tagging.count', +3) do
      post :create, {:quiz => Factory.attributes_for(:quiz), :tags => tags}
    end
  end
   
end
