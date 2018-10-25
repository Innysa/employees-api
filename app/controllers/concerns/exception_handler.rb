module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ArgumentError do |e|
      json_response(parse_error(e, 400), :bad_request)
    end

    rescue_from StandardError do |e|
      json_response(parse_error(e, 500), :internal_server_error)
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response(parse_error(e, 404), :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response(parse_error(e, 422), :unprocessable_entity)
    end
  end

  def parse_error(e, code=200)
    {
      errors: [{
        code: code.to_s,
        message: e.message
      }]
    }
  end
end