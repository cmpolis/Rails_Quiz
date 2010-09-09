class Matching < Quiz

  def build_question
    question = (1..4).collect { self.questions.build }
    question.each {|q| q.answers.build}
    question
  end

  # Tries to save question(s) from params, returns true if saved
  def validate_question params

  end

end
