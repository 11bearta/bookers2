class BooksController < ApplicationController
  before_action :authenticate_user!, only:[:index, :new, :edit, :create, :show,]
  # before_action :authenticate_current_user!, only:[:edit]
  def top
  end

  def about
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    if Book.find_by(id: params[:id])

      @book_show = Book.find(params[:id])
      @user = User.find(current_user.id)
      @book = Book.new

    else redirect_to books_path
    end
  end

  def new
  end

  def edit
    @book = Book.find(params[:id])
        if @book.user_id != current_user.id
          redirect_to book_path
        end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(book.id)
    else
      render :edit
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
      if @book.save
        redirect_to books_path
      else
        @books = Book.all
        render :index
      end

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
