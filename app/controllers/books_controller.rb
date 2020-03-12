class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :book_user, only: [:edit, :update]
  def index
  	  @book = Book.new
  	  @books =Book.all
      @user = current_user
  end

  def create
  	  @book = Book.new(book_params)
  	  @books = Book.all
  	  @book.user_id = current_user.id
  	  if @book.save
  	  	 flash[:notice] = 'successfully'
  	  	 redirect_to book_path(@book.id)
  	  else
         @user = current_user
  	  	 render 'index'
  	  end
  end

  def show
  	  @book = Book.find(params[:id])
      @a = Book.new
      @user = @book.user
  end

  def edit
  	  @book = Book.find(params[:id])
  end

  def update
  	   @book = Book.find(params[:id])
  	   if @book.update(book_params)
  	   flash[:notice] = 'successfully'
  	   redirect_to book_path(@book.id)
       else
       render 'edit'
       end
  end

  def destroy
  	  book = Book.find(params[:id])
  	  book.destroy
  	  redirect_to books_path
  end

  private
  def book_params
  	  params.require(:book).permit(:title, :body,)
  end

  def book_user
      @book = Book.find(params[:id])
      unless @book.user == current_user
      redirect_to books_path
      end
  end
end
