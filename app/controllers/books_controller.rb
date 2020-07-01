class BooksController < ApplicationController
    before_action :redirect_if_not_logged_in
   
    def index
        @books = Book.all
        end
    end
    
    def new
        @book = Book.new
    end

    def create
        @book = current_user.books.build(book_params)
        if @book.save
            redirect_to books_path
        else
            render :new
        end
    end

    def show
        @book = Book.find_by(id: params[:id])
    end

    def destroy
    end

    private

    def book_params
        params.require(:book).permit(:title, :author)
    end

end
