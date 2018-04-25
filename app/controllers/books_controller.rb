class BooksController < ApplicationController
  before_action :authenticate_user!, only:[:index, :new, :edit, :create,]
  # before_action :authenticate_current_user!, only:[:edit]
  def top
  end

  def about
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def show
    @book_show = Book.find(params[:id])
    @user = User.find(current_user.id)
    @book = Book.new
  end

  def new
  end

  def edit
    @book = Book.find(params[:id])
        if @book.user == current_user
        else
          redirect_to book_path
        end
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
    
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to user_path(current_user.id)
    
  end

  private
  def book_params
        params.require(:book).permit(:Title, :Opinion, :user_id)
  end

end
