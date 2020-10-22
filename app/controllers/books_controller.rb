class BooksController < ApplicationController
    before_action :set_book,only: [:show,:edit,:update,:destroy]
    
    def index
        @books = Book.all
    end
    
    def new
        @book = Book.new
    end
    
    def create
        @book = current_user.books.new(book_params)
        if @book.save
            redirect_to book_path(@book)
        else
            render :new
        end
    end
    
    def show
        @book = Book.find(params[:book_id])
    end
    
    def edit
        @book = Book.find(params[:book_id])
    end
    
    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
          redirect_to @book
        else
          render :edit
        end
    end
    
    def destroy
        @book.destroy
        redirect_to books_path
    end

    
    private
        def book_params
          params.require(:book).permit(:title, :description)
        end
        
        def set_book
            @book = Book.find(params[:book_id])
        end    
end
