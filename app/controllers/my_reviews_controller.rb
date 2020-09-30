class MyReviewsController < ApplicationController
    before_action :authenticate_user!
    def index
        reviews = Review.where(user_reviewed:current_user.email)
        respond_to do |format|
            format.html do
                render :index, locals: { reviews: reviews }
            end
        end
    end
end

