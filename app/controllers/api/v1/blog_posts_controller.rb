class Api::V1::BlogPostsController < Api::V1::BaseController

	def show
		blog_post = BlogPost.find(params[:id])
		render(json: Api::V1::BlogPostSerializer.new(blog_post).to_json)
  end

end