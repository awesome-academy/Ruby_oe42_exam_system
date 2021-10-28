class TestsController < ApplicationController
  before_action :find_by_test, only: %i(show edit update)
  before_action :logged_in_user
  before_action :change_time_test, only: :edit
  after_action :change_actual_test_time, only: :edit
  after_action :create_test_questions_exams, only: :create
  before_action :load_questions_exam, only: %i(create edit)
  # after_action :check_answer, only: :edit
  # before_action :load_questions, only: %i(new create show)

  def index
    @test = Test.includes(:user, :exam).all.page(params[:page])
                .per Settings.show_5
  end

  def edit; end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.tests.build test_params
    if @test.save
      flash[:success] = t "success_test"
      redirect_to tests_path
    else
      flash[:danger] = t "fail_test"
      render :new
    end
  end

  def update
    if @test.update params.permit Test::TEST_PARAMS
      flash[:success] = t "do_test_success"
      redirect_to test_path
    elsif flag == true
      render :show
    else
      flash.now[:danger] = t "do_test_fail"
      render :edit
    end
  end

  private
  def test_params
    params.require(:test).permit Test::TEST_PARAMS
  end

  def check_answer
    @test.total_score = 0
    @test.test_questions_exams.each do |test_questions_exam|
      next unless test_questions_exam.answer_id_choose != -1

      answer = Answer.find_by id: :test_questions_exam.answer_id_choose
      if answer.check == "right"
        @test.total_score += test_questions_exam.questions_exam.score
      end
    end
    @test.total_score
  end

  def find_by_test
    @test = Test.find_by id: params[:id]
    return if @test

    flash[:danger] = t "exam_not_found"
    redirect_to root_url
  end

  def load_test
    @test = Test.get_list
  end

  def load_questions_exam
    @test_questions_exam = TestQuestionsExam.get_list
  end

  def change_actual_test_time
    @test.actual_test_time = DateTime.now
  end

  def change_time_test
    @test.time_test = DateTime.now
  end

  def create_test_questions_exams
    list_question_exam_for_a_test(@test).each do |questions_exam|
      TestQuestionsExam.create(test_id: @test.id,
        questions_exam_id: questions_exam.id, answer_id_choose: -1)
    end
  end
end
