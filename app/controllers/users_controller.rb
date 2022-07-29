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
    @user = current_user.id
  end
end
