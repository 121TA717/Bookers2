class BooksController < ApplicationController
  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
   @book = Book.find(params[:id])
   @user = User.find(params[:id])
   @books = @user.books
   @profile_image = @user.profile_image
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
   flash[:notice] = "You have created book successfully."
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   @book.save
   redirect_to books_path
  end

  def update
    flash[:notice] = " You have updated book successfully."

  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
