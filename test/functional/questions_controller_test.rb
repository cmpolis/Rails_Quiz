require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
=begin
  test "Redirect to root if question#new gives invalid id" do
    get :new, :id => nil
    assert_redirected_to root_url
    assert_equal "Invalid quiz id"

    get :new, :id => 12345
    assert_redirected_to root_url
    assert_equal "Invalid quiz id" 
  end  
=end
  test "Must be quiz creator for question#new" do
    @controller.current_user = nil
    get :new, :id => 1
    assert_redirected_to root_url
    assert_equal "Must be quiz creator to add a question", flash[:notice]
    @controller.current_user = Factory(:user_high_id)
    get :new, :id => 1
    assert_redirected_to root_url
    assert_equal "Must be quiz creator to add a question", flash[:notice]
  
    user = Factory(:user)
    @controller.current_user = user
    quiz = quizzes(:valid)  
    quiz.creator_id = user.id
    quiz.save
    get :new, :id => quiz.id
    assert_response(:success) # i.e. not redirected
  end
=begin
  test "Question#create makes a new quiz, redirects to add another question" do
    @controller.current_user = Factory(:user)
    quiz = quizzes(:valid)
    quiz.creator_id = @controller.current_user.id
    assert_difference(['Question.count', 'Answer.count']) do
      post :create, { :question => Factory.attributes_for(:question), :answers => [ Factory.attributes_for(:answer1), Factory.attributes_for(:answer2), Factory.attributes_for(:answer3) ] }
    end
    assert_redirected_to :action => "new", :id => quiz.id
  end
=end
end
