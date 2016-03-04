class RatingsController < ApplicationController

 def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    if @rating.save
      redirect_to root_path, notice: 'Rating was successfully created.'
    else
      render :new
    end
  end

  def rating_params
    params.require(:rating).permit(:rating, :user_id, :blog_post_id)
  end

end