class BooksController < ApplicationController
  # before_action :side, only: [:index, :show]

  def top
  end

  def about
  end

  def index

  end

  def show
  end

  def new
  end

  def edit

  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to 'users_show_path'
  end

  private
 
  def book_params
        params.require(:book).permit(:Title, :Opinion)
  end

end
