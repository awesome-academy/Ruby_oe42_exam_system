class SubjectsController < ApplicationController
  before_action :find_by_subject, only: %i(edit destroy)
  before_action :logged_in_user

  def index
    @subjects = Subject.includes(:user)
                       .all.page(params[:page]).per Settings.show_5
  end

  def edit; end

  def show; end

  def new
    @subject = Subject.new
  end

  def create
    @subject = current_user.subjects.build subject_params
    if @subject.save
      flash[:success] = t "success_subject"
      redirect_to subject_url
    else
      flash[:danger] = t "fail_subject"
      render :new
    end
  end

  def update; end

  def destroy
    if @subject.destroy
      flash[:success] = t "deleted"
    else
      flash[:danger] = t "fail_delete"
    end
    redirect_to request.referer || root_url
  end

  private
  def subject_params
    params.require(:subject).permit Subject::SUBJECT_PARAMS
  end

  def find_by_subject
    @subject = Subject.find_by id: params[:id]
    return if @subject

    flash[:danger] = t "subject_not_found"
    redirect_to root_url
  end
end
