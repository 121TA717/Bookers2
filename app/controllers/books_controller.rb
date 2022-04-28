class BooksController < ApplicationController
  def show
    @book = Book.new
  end
  
  def create
  end
  
end
