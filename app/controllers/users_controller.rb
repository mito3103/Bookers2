class UsersController < ApplicationController
  before_action :correct_user, only: [:edit]

  def new
  end

  def index
    @book = Book.new
    @profile_image = current_user.profile_image
    @name = current_user.name
    @intro = current_user.introduction
    @users = User.all
    @user = current_user
  end

  def show
    @book = Book.new
    #@books = Book.find(params[:id])
    @user = User.find(params[:id])
    #@user = current_user
    @books = @user.books
    @profile_image = @user.profile_image
    @name = @user.name
    @intro = @user.introduction
  end

  def edit
    @user = User.find(params[:id])
    #@users = current_user
  end

  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      #@user = User.find(params[:id])
      @users = current_user
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) unless @user == current_user
  end

end
