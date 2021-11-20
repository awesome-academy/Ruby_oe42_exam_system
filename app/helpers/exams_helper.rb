module ExamsHelper
  def load_name_subject
    Subject.pluck(:name, :id)
  end

  def load_content_question question
    question.pluck(:content, :id)
  end
end
