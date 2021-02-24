module V1::User::Operation
  class Login < Trailblazer::Operation

    step :check_params
    fail Api::Macro.MissingParams(params: "user")

    step :load_user
    fail Api::Macro.RecordNotFound

    step :check_valid_password
    fail :invalid_password, fail_fast: true

    step :send_data
    fail Api::Macro.SomethingWentWrong

    def check_params(ctx, params:, **)
      params[:user].present?
    end

    def load_user(ctx, params:, **)
      ctx[:user] = User.where(email: params[:user][:email]).first
    end

    def check_valid_password(ctx, params:, user:, **)
      user.valid_password?(params[:user][:password])
    end

    def invalid_password(ctx, **)
      ctx[:error] = {
        msg: I18n.t("errors.invalid_creds"),
        code: 401
      }
    end

    def send_data(ctx, user:, **)
      ctx[:model] = {
        email: user.email,
        api_key: user.generate_api_key
      }
    end

  end
end