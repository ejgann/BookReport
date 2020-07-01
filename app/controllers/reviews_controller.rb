class ReviewsController < ApplicationController
    before_action :get_user

    def index
        # if there is a nested route and the user exists
        if params[:user_id]
            @reviews = @user.reviews 
        else
        @reviews = Review.all
        end
    end

    def new
        @review = @user.reviews.build
    end
    
    def create
        @review = @user.reviews.build(review_params)
        if @review.save
            redirect_to user_reviews_path(@user)
        else
            render :new
        end
    end

    def show
        @review = Review.find_by_id(id: params[:id])
    end

    private

    def get_user
        @user = User.find(params[:user_id])
    end

    def review_params
        params.require(:review).permit(:title, :rating, :comment)
    end


end
