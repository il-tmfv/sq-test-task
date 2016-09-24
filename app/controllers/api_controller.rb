class ApiController < ApplicationController
  respond_to :json

  skip_before_action :verify_authenticity_token
  before_action :check_request_format!

  protected

  def bad_request_format
    render status: 406, json: { error: ApiError::FORMAT }
  end

  def check_request_format!
    bad_request_format if request.format != :json
  end
end
