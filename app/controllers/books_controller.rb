class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new
    @books = Book.all
    @profile_image = current_user.profile_image
    @name = current_user.name
    @intro = current_user.introduction
    @user = current_user
  end

  def show
    @book = Book.new
    @books = Book.find(params[:id])
    @profile_image = @books.user.profile_image
    @name = @books.user.name
    @intro = @books.user.introduction
    @user = current_user
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(book)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path()
  end

  def destroy
    @books = Book.find(params[:id])
    @books.destroy
    redirect_to '/books'
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
