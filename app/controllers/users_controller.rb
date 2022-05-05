class UsersController < ApplicationController
  def index
   @users = User.all
   @user = current_user
  end

  def show
   @user = User.find(params[:id])
   @books = @user.books
   @profile_image = @user.profile_image
   @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    flash[:notice] = " You have updated user successfully."
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  def create
    flash[:notice] = " Welcome! You have signed up successfully."
  end


  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
