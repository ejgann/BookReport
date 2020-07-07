class ReviewsController < ApplicationController
    
    def index
        # if a review is nested and the user exists
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @reviews = @user.reviews 
        else
            @error = "That review doesn't exist" if params[:user_id]
            @reviews = Review.all
        end
    end

    def new
        # if it's nested and if the user is found
        if params[:book_id] && @book = Book.find_by_id(params[:book_id])
            @review = @book.reviews.build
        else
            @error = "There is no such book" if params[:book_id]
        @review = Review.new
        end
    end
    
    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to book_reviews_path
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
