module V1::User::Operation
  class Index < Trailblazer::Operation

    step :load_users
    fail Api::Macro.SomethingWentWrong

    def load_users(ctx, **)
      ctx[:model] = User.all
    end
  end
end