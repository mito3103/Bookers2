class UsersController < ApplicationController
  def new
  end

  def show
  end

  def edit
    @user = current_user.id
  end
end
