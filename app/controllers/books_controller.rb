class BooksController < ApplicationController
  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
   @book = Book.find(params[:id])
   @user = @book.user
   @books = @user.books
   @profile_image = @user.profile_image
   @newbook = Book.new
  end

  def edit
  @book = Book.find(params[:id])
  end

  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
   else
      @books = Book.all
      @user = current_user
      render :index

   end
   
  end

  def update
     @book = Book.find(params[:id])
     if @book.update(book_params)
      flash[:notice] = "You have update book successfully."
      redirect_to book_path(@book.id)
     else
      @books = Book.all
      @user = current_user
      render :index
     end
  end

  def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
