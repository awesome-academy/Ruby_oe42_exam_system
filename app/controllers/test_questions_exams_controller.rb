class TestQuestionsExamsController < ApplicationController
  before_action :find_by_test_questions_exam, only: %i(show destroy)
  before_action :logged_in_user

  def show
    @test = @test_questions_exam.test
  end

  def edit; end

  def new
    @test_questions_exam = TestQuestionsExam.new
  end

  def create
    params = test_questions_exam_params
    if @test && @test.exam.questions_exams << QuestionsExam.find
      (
        params[:questions_exam_id]
      )

      redirect_to root_path
    else
      flash[:danger] = "fail_question"
      render :new
    end
  end

  def destroy
    if @test_questions_exam.destroy
      flash[:success] = "deleted_question"
    else
      flash[:danger] = "fail_delete"
    end
    redirect_to request.referer || root_url
  end

  private
  def test_questions_exam_params
    params.require(:test_questions_exam)
          .permit TestQuestionsExam::TEST_QUESTIONS_EXAM_PARAMS
  end

  def find_by_test_questions_exam
    @test_questions_exam = TestQuestionsExam.find_by id: params[:id]
    return if @test_questions_exam

    flash[:danger] = t "question_not_found"
    redirect_to root_url
  end
end
