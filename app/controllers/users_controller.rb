class UsersController < ApplicationController
  before_action :suppervisor_user, only: %i(create edit update)
  before_action :find_by_user, except: %i(index new create)

  def index
    @users = User.all.page(params[:page]).per Settings.show_5
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    return unless logged_in?

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

  def suppervisor_user
    redirect_to root_url unless current_user.suppervisor?
  end

  def find_by_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t "user_not_found"
    redirect_to root_url
  end
end
