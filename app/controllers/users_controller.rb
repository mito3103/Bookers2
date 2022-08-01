class UsersController < ApplicationController
  def new
  end

  def index
    @user = current_user
    @profile_image = @user.profile_image
    @book = Book.new
    @books = Book.all
    @users = User.all
  end

  def show
    @user = current_user
    @profile_image = @user.profile_image
    @book = Book.new
    @books = Book.all
  end

  def edit
    @user = User.new
    @users = current_user
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
