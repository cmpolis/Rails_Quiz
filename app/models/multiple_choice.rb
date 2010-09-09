class MultipleChoice < Quiz

  def build_question
    question = self.questions.build
    (1..4).each {question.answers.build}
    question
  end

  # Tries to save question(s) from params, returns true if saved
  def validate_question params
    @question = Question.new(params[:question])
    @question.valid?  # generate errors for question

    right_answers = @question.answers.find_all { |ans| ans.right }
    @question.errors.add_to_base "Must have exactly one right answer" \
           if right_answers.length != 1

    @question
  end

end
