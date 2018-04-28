class UsersController < ApplicationController
    before_action :authenticate_user!
    # before_action :current_user!, only:[:edit]
  def show

    if User.find_by(id: params[:id])

  	@user = User.find(params[:id])
  	@book = Book.new
    @books_show = @user.books

  else redirect_to users_path
    end
  end

  def index
  	@users = User.all
  	@book = Book.new
    @user = User.find(current_user.id)
  end

  def edit
      @user = User.find(params[:id])
        if @user != current_user
          redirect_to users_path
        end

    end


    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
    end


 private
  def user_params
        params.require(:user).permit(:name, :introduction, :image)
  end
end
