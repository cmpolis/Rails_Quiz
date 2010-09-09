class List < Quiz

  def build_question
    question = self.questions.build
    (1..8).each {question.answers.build}
    question
  end

  # Tries to save question(s) from params, returns true if saved
  def validate_question params
    @question = Question.new(params[:question])
    @question.valid?  # generate errors for question

    @question.answers.each do |ans|
      ans.delete if ans.text.blank?
    end
    
    @question.valid?

    @question
  end
  
end
