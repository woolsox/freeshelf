class BooksController < ApplicationController
 before_action :require_login, only: %i[new edit create update destroy]
 before_action :is_owner, only: %i[edit update destroy]

 def index
  @books = Book.all
 end

 def show
  @book = Book.find(params[:id])
 end

 def new
  @book = Book.new
 end

 def edit
  @book = Book.find(params[:id])
 end

 def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id if current_user
  if @book.save
   redirect_to @book
  else
   render 'new'
  end
 end

 def update
  @book = Book.find(params[:id])

  if @book.update(book_params)
   redirect_to @book
  else
   render 'edit'
  end
 end

 def destroy
  @book = Book.find(params[:id])
  @book.destroy

  redirect_to books_path
 end

 private

 def book_params
  params.require(:book).permit(:title, :author, :description, :link)
 end

 def require_login
  redirect_to new_session_path unless logged_in?
 end

 def is_owner
  @book = Book.find(params[:id])
  redirect_to books_path unless @book.user_id == current_user.id
 end
end
