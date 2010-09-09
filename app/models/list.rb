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

  def possible
    answers.count
  end

  def correct user_answers
    user_answers.count
  end

  # Builds quiz_entry object from params
  def validate_entry params
    @quiz_entry = QuizEntry.new params[:quiz_entry]
    @quiz_entry.valid?        # Build errors

    # Answers are given in a 2d hash: [question_id][answer_index]
    params[:answers].each_key do |question_key|
      question = Question.find(question_key.to_i)
      question.answers.each do |answer|
        if params[:answers][question_key].include? answer.text
          @quiz_entry.answer_entries.build :answer_id => answer.id
        end
      end
    end

    @quiz_entry
  end
  
end
