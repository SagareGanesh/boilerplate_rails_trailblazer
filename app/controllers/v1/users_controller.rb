class V1::UsersController < V1::BaseController
  skip_before_action :authenticate!, only: [:login]

  def login
    user_params = params[:user]
    user = User.where(email: user_params[:email]).first
    if user and user.valid_password?(user_params[:password])
      render json: { email: user.email, api_key: user.generate_api_key }
    else
      render json: { message: "Invalid credentials" }, status: 401
    end
  end

  def index
    render json: User.all, each_serializer: V1::UserSerializer
  end
end
