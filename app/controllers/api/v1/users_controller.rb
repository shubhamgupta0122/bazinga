class Api::V1::UsersController < Api::V1::BaseController

	def show
		user = User.find(params[:id])
		render(json: Api::V1::UserSerializer.new(user).to_json)
		# render :show, status: :created, location: @blog_post
  end

  def create
  	user = User.new(user_params)
  	if @user.save
      render(json: Api::V1::UserSerializer.new(user).to_json)
    else
      render(json: {status: "error"})
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password)
  end

end