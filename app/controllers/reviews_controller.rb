class ReviewsController < ApplicationController

  def create
    
    @book=Book.find(params[:book_id])
    @review = @book.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to @book
    else 
       render "books/show"
      end
  end


  def review_params
    params.require(:review).permit(:rating,:comment)
  end
end
