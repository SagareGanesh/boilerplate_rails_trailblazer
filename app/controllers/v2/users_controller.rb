class V2::UsersController < V1::UsersController
  def index
    run ::V1::User::Operation::Index do |result|
      return  render json: result[:model], each_serializer: V2::UserSerializer
    end

    render json: { error: result[:error][:msg] }, status: result[:error][:code]
  end
end
