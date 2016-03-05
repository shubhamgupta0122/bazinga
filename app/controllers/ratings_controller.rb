class RatingsController < ApplicationController

 def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    if (@rating.rating < 0 || @rating.rating > 5)
      @blog_post = BlogPost.find_by(id: @rating.blog_post_id)
      redirect_to @blog_post, alert: 'Rating can be in the range 0 - 5 only'
    elsif @rating.save
      set_avg_rating
      redirect_to root_path, notice: 'Rating was successfully created.'
    else
      render :new
    end
  end

  def rating_params
    params.require(:rating).permit(:rating, :user_id, :blog_post_id)
  end

  private
  def set_avg_rating
    ratings = Rating.where(blog_post_id: @rating.blog_post_id)
    avg_rating = ratings.pluck(:rating).sum / ratings.count
    blog_post = BlogPost.find(@rating.blog_post_id)
    BlogPost.update(blog_post.id, avgrating: avg_rating)
  end

end