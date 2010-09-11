class MultipleChoice < Quiz

  def build_question
    question = self.questions.build
    (1..4).each {question.answers.build}
    question
  end

  # Builds question object from params
  def validate_question params
    @question = Question.new(params[:question])
    @question.valid?  # generate errors for question

    right_answers = @question.answers.find_all { |ans| ans.right }
    @question.errors.add_to_base "Must have exactly one right answer" \
           if right_answers.length != 1

    @question
  end

  def possible_count
    questions.count
  end

  def correct answers
    answers.select { |ans| ans.right }.count
  end
  
  # Builds quiz_entry object from params
  def validate_entry params
    @quiz_entry = QuizEntry.new params[:quiz_entry]
    @quiz_entry.valid?        # Build errors

    params[:answers] ||= []
    params[:answers].each do |answer|
      @quiz_entry.answer_entries.build :answer_id => answer
    end

    @quiz_entry.quiz.questions.each do |question|
      #if question.answers.find_all_by_id(params[:answers]).length == 0
      #  @quiz_entry.errors.add_to_base "No answer for: #{question.text}"
      if question.answers.find_all_by_id(params[:answers]).length > 1
        @quiz_entry.errors.add_to_base "More than one answer for: #{question.text}"
      end
    end

    @quiz_entry
  end

end
