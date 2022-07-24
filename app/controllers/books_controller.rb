class BooksController < ApplicationController
  def new
  end

  def index
    @user = current_user
    @profile_image = @user.profile_image
  end

  def show
  end

  def destroy
  end
end
