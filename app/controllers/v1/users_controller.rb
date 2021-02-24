class V1::UsersController < V1::BaseController
  skip_before_action :authenticate!, only: [:login]

  def login
    run ::V1::Usesr::Operation::Login do |result|
      return  render json: result[:model]
    end

    render json: { error: result[:error][:msg] }, status: result[:error][:code]
  end

  def index
    run ::V1::User::Operation::Index do |result|
      return  render json: result[:model], each_serializer: V1::UserSerializer
    end

    render json: { error: result[:error][:msg] }, status: result[:error][:code]
  end
end
