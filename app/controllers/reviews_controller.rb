class ReviewsController < ApplicationController
    
    def index
        @reviews = Review.all
    end

    def new
        # # if the book exists in database and can be found by its id, then associate it with the book
        # if params[:book_id] && @book = Book.find_by_id(params[:book_id])
        #     @review = @book.reviews.build
        # # otherwise create a new independent review
        # else
         @review = Review.new
        # end
    end
    
    def create
        @book = Book.find_by_id(book_id: params[:book_id])
    @review = @book.reviews.build(review_params)
    if @review.save
        redirect_to @review
    else
        render :new
        end
    end


    def show
        @review = Review.find_by_id(id: params[:id])
    end

    private

    def review_params
        params.require(:review).permit(:title, :rating, :comment, :user_id, :book_id)
    end

end
