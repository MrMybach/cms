class BooksController < ApplicationController

	layout 'application'
  
  def index
  	@books = Book.newest_first
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)

  	if @book.save
  		flash[:notice] = "Książka została zapisana."
  		redirect_to(:action => 'index')
  	else
  		flash[:notice] = "Coś poszło nie tak. Spróbuj jeszcze raz."
  		# puts "Coś poszło nie tak. Spróbuj jeszcze raz."
  		render('new')
  	end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])

  	if @book.update_attributes(book_params)
  		flash[:notice] = "Zaktualizowano pomyślnie."
  		redirect_to('index')
  	else
  		flash[:notice] = "Coś poszło nie tak. Spróbuj jeszcze raz."
  		render('edit')
  	end
  end

  def delete
  	@book = Book.find(params[:id])
  end

  def destroy
  	@book = Book.find(params[:id]).destroy
  	redirect_to('index')
    flash[:notice] = "Książka o tytule #{@book.title} została usunięta."
  end

  private

	  def book_params
	  	params.require(:book).permit(:title, :author, :year, :category, :series_name, :pages, :language, :read, :cover)
	  end
end
