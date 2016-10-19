class UsersController < ApplicationController
  before_action :signed_in_user, :correct_user, only: [:index, :show, :edit, :update]

  def index
    @users = User.all.sort_by { |user| user.email.include?("esrc-zbp.ru") ? 0 : 1 }
  end

  def new
  	@user = User.new
  end

  def edit
    puts params.inspect
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Профиль обновлен!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		sign_in @user
  		flash[:success] = "Добро пожаловать на сайт ГКУ 'ЕСРЦ' Забайкальского края!"
  		redirect_to @user
  	else
  		render 'new'
    end
  end

private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def signed_in_user
    redirect_to signin_url, notice: "Для доступа к странице необходимо войти на сайт" unless sign_in?
  end

  def correct_user
    if sign_in_admin?
      @user = User.find(current_user.id)
    else
      @user = User.find(params[:id])
    end
    redirect_to(root_url) unless sign_in_admin? || current_user?(@user)
  end
end
