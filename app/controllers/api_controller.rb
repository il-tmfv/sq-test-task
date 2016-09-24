class ApiController < ApplicationController
  respond_to :json

  skip_before_action :verify_authenticity_token
  before_action :check_request_format!

  rescue_from Exception, with: :unknown_exception
  rescue_from ActiveRecord::RecordInvalid,  with: :invalid_record_exception
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_exception

  protected

  def record_not_found_exception(exception)
    render status: 404, json: { code: 404, error: exception.message }
  end

  def invalid_record_exception(exception)
    render status: 405, json: { code: 405, error: exception.message }
  end

  def unknown_exception(exception)
    render status: 500, json: { code: 500, error: exception.message }
  end

  def bad_request_format
    render status: 406, json: { error: ApiError::FORMAT }
  end

  def check_request_format!
    bad_request_format if request.format != :json
  end

  def render_ok
    response.headers['Cache-Control'] = 'no-cache'
    render json: ''
  end
end
