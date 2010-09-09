class ShortAnswer < Quiz

  def build_question
    question = self.questions.build
    question.answers.build
    question
  end

  # Tries to save question(s) from params, returns true if saved
  def validate_question params
    @question = Question.new(params[:question])
    @question.valid?  # generate errors for question
    @question
  end

end
