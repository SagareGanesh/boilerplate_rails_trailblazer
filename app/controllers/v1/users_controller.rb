class V1::UsersController < V1::BaseController
  def index
    render json: User.all, each_serializer: V1::UserSerializer
  end
end
