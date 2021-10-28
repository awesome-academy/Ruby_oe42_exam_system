module TestsHelper
  def list_answer_from_question question
    Question.find_by(id: question.id).answers
  end

  def list_question_exam_for_a_test test
    test.exam.questions_exams.includes(:question)
  end

  def load_name_exam
    Exam.pluck(:subject_id, :id)
  end

  def list_question_for_a_test test
    test.exam.questions
  end

  def time_do_test test
    test.time_test - test.actual_test_time
  end

  def test_questions_exams_answer test
    test.test_questions_exams.answer_id_choose
  end

  def set_questions_exam_id test_question_exam, questions_exam
    test_question_exam.questions_exam_id = questions_exam.id
  end

  def list_test_question_exam_for_a_test test
    test.test_questions_exams
  end
end
