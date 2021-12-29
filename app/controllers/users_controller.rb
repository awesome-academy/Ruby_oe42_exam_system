class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user, except: %i(index create)
  before_action :logged_in_supervisor, except: :show
  before_action :correct_user, only: %i(edit update)
  authorize_resource

  def index
    @users = User.all.page(params[:page]).per Settings.show_5
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "success"
      redirect_to root_url
    else
      flash[:danger] = t "fail"
      render :new
    end
  end

  def update; end

  def destroy; end

  private
  def user_params
    params.require(:user).permit User::USER_PARAMS
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t "not_found"
    redirect_to root_path
  end

  def correct_user
    return if @user == current_user

    flash[:warning] = t "incorrect_user"
    redirect_to root_path
  end
end
