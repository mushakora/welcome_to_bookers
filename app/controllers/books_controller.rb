class BooksController < ApplicationController
  def index
  	  @book = Book.new
  	  @books =Book.all
  end

  def create
  	  @book = Book.new(book_params)
  	  @books = Book.all
  	  @book.user_id = current_user.id
  	  if @book.save
  	  	 flash[:notice] = 'successsfully'
  	  	 redirect_to book_path(@book.id)
  	  else
  	  	 render 'books#index'
  	  end
  end

  def show
  	  @book = Book.find(params[:id])
  end

  def edit
  	  @book = Book.find(params[:id])
  end

  def update
  	  book = Book.find(params[:id])
  	  book.update(book_params)
  	  flash[:notice] = 'successsfully'
  	  redirect_to book_path(book.id)
  end

  def destroy
  	  book = Book.find(params[:id])
  	  book.destroy
  	  redirect_to book_path
  end

  private
  def book_params
  	  params.require(:book).permit(:title, :body,)
  end
end
