class Api::V1::BlogPostsController < Api::V1::BaseController
	before_action :set_blog_post, only: [:show, :update, :destroy]

  def index
    @blog_posts = BlogPost.all.order(avgrating: :desc)
    render(json: @blog_posts.map{|f| Api::V1::BlogPostSerializer.new(f)}.to_json)
  end

	def show
		render(json: Api::V1::BlogPostSerializer.new(@blog_post).to_json)
  end

  def create
  	@blog_post = BlogPost.new(blog_post_params)
  	if @blog_post.save
  		render(json: Api::V1::BlogPostSerializer.new(@blog_post).to_json)
  	else
  		render(json: {status: "error"})
  	end
  end

  def update
  	@blog_post.update(blog_post_params)
  	if @blog_post.save
  		render(json: Api::V1::BlogPostSerializer.new(@blog_post).to_json)
  	else
  		render(json: {status: "error"})
  	end
  end

  def destroy
  	@blog_post.destroy
  	render(json: {status: "success, blog_post deleted"})
  end

####################

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
  end

  def blog_post_params
    params.require(:blog_post).permit(:title, :description, :author, :user_id)
  end

end