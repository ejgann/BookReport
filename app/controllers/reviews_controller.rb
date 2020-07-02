class ReviewsController < ApplicationController
    # before_action :get_user
    
    def index
        # # if a review is nested and the user exists
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @reviews = @user.reviews 
        else
            flash[:message] = "That review doesn't exist"
            @reviews = Review.all
        end
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
