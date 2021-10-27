class QuestionsController < ApplicationController
  before_action :find_by_question, only: %i(edit update destroy)
  before_action :logged_in_user

  def index
    @questions = Question.includes(:user).includes([:answers]).all.page(
      params[:page]
    ).per Settings.show_5
  end

  def edit; end

  def show; end

  def new
    @question = current_user.questions.build.tap do |r|
      r.answers.build
    end
  end

  def create
    @question = current_user.questions.build question_params

    if @question.save
      flash[:success] = t "success_question"

      redirect_to root_path
    else
      flash[:danger] = t "fail_question"
      render :new
    end
  end

  def update
    if @question.update question_params
      flash[:success] = t "updated_successfully"
      redirect_to root_path
    else
      flash.now[:danger] = t "updated_failed"
      render :edit
    end
  end

  def destroy
    if @question.destroy
      flash[:success] = t "deleted_question"
    else
      flash[:danger] = t "fail_delete"
    end
    redirect_to request.referer || root_url
  end

  private
  def question_params
    params.require(:question).permit Question::QUESTION_PARAMS
  end

  def find_by_question
    @question = Question.find_by id: params[:id]
    return if @question

    flash[:danger] = t "question_not_found"
    redirect_to root_url
  end
end
