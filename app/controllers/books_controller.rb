class BooksController < ApplicationController
    def index
        @books = Book.all
        render json: @books
    end

    def show
        @book = Book.find(params[:id])
        render json: @book
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            render json: @book, status: 200
        else
            render error: { error: 'Unable to create book.' }, status: 400
        end
    end

    def update
        @book = Book.find(params[:id])
        if @book
            @book.update(book_params)
            render json: { message: 'Book successfully updated' }, status: 200
        else
            render json: { message: 'Unable to update book.' }, status: 400
        end
    end

    def destory
        @book = Book.find(params[:id])
        if @book
            @book.destroy
            render json: { message: 'Book was successfully deleted.' }, status: 200
        else
            render json: { message: 'Unable to deleted book. ' }, status: 400
        end 
    end

    private
    def book_params
        params.require(:book).permit(:title, :author, :genre, :isbn, :language)
    end
end
