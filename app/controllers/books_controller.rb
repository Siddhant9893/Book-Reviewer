class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  
  def index
    @books=Book.order(created_at: :desc).page(params[:page]).per(3)
  end

  def show
    @book=Book.find(params[:id])
    @review=@book.reviews.build
    @reviews = @book.reviews
  end

  def new
    @book = current_user.books.new
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to books_path
    else 
      render :new
    end
  end

  def edit
    @book=current_user.books.find(params[:id])
  end

  def update
    @book=current_user.books.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path
    else
      render :edit
  end
end

  def destroy
    @book = current_user.books.find(params[:id])
    @book.destroy
    redirect_to books_path

  end
  
  private
  def book_params
    params.require(:book).permit(:title,:author,:description)
  end

end
