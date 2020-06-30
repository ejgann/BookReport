class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end

    def new
        @review = Review.new
    end
    
    def create
        @review = current_user.review.build(review_params)
        if @review.save
            redirect_to reviews_path
        else
            render :new
        end
    end

    def show
        @review = Review.find_by_id(id: params[:id])
    end

    private

    def review_params
        params.require(:review).permit(:title, :rating, :comment)
    end


end
