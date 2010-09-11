class ShortAnswer < Quiz

  def build_question
    question = self.questions.build
    question.answers.build
    question
  end

  def possible_count
    questions.count
  end

  def correct user_answers
    user_answers.count
  end

  # Tries to save question(s) from params, returns true if saved
  def validate_question params
    @question = Question.new(params[:question])
    @question.valid?  # generate errors for question
    @question
  end

  # Builds quiz_entry object from params
  def validate_entry params
    @quiz_entry = QuizEntry.new params[:quiz_entry]
    @quiz_entry.valid?        # Build errors

    # Answers are given in a 2d hash: [question_id][answer_index]
    params[:answers].each_key do |question_key|
      question = Question.find(question_key.to_i)
      if params[:answers][question_key].strip.downcase == question.first_answer
        @quiz_entry.answer_entries.build :answer_id => question.answers.first.id
      end
    end

    @quiz_entry
  end

end
