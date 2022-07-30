class BooksController < ApplicationController
  def new
  end

  def index
    @user = current_user
    @profile_image = @user.profile_image
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = current_user
    @profile_image = @user.profile_image
    @book = Book.new
    @books = Book.find(params[:id])
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to book_path(book.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
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
