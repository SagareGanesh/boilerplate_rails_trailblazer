module Api
  module Macro

    def self.MissingParams(params:, fail_fast: true)
      step = ->((ctx, flow_options), _) do
        ctx[:error] = {
          msg: I18n.t('errors.missing_params', params: params),
          code: 404
        }

        return Trailblazer::Activity::Left, [ctx, flow_options]
      end

      { task: step, id: 'missing_params', fail_fast: fail_fast}
    end

    def self.RecordNotFound(fail_fast: true)
      step = ->((ctx, flow_options), _) do
        ctx[:error] = {
          msg: I18n.t('errors.record_not_found'),
          code: 404
        }

        return Trailblazer::Activity::Left, [ctx, flow_options]
      end

      { task: step, id: 'record_not_found', fail_fast: fail_fast}
    end

    def self.SomethingWentWrong(fail_fast: true)
      step = ->((ctx, flow_options), _) do
        ctx[:error] = {
          msg: I18n.t('errors.something_went_wrong'),
          code: 422
        }

        return Trailblazer::Activity::Left, [ctx, flow_options]
      end

      { task: step, id: 'something_went_wrong', fail_fast: fail_fast}
    end

  end
end