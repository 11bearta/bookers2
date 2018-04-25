class UsersController < ApplicationController
    before_action :authenticate_user!
    # before_action :current_user!, only:[:edit]
  def show
  	@user = User.find(params[:id])
  	@book = Book.new
    @books_show = @user.books
  end

  def index
  	@users = User.all
  	@book = Book.new
    @user = User.find(current_user.id)
  end

  def edit
      @user = User.find(params[:id])
        if @user == current_user
        else
          redirect_to users_path
        end

    end


    def update
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to user_path(current_user.id)
    end


 private
  def user_params
        params.require(:user).permit(:name, :introduction, :image)
  end
end
