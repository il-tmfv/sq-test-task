class ApiError
  NOT_FOUND = {
      code: 404,
      message: 'Record not found.'
  }.freeze

  INVALID = {
      code: 405,
      message: 'Validation failed.'
  }.freeze

  FORMAT = {
      code: 406,
      message: 'The request format must be json.'
  }.freeze

  INVALID_ARGUMENTS = {
      code: 407,
      message: 'Invalid or not enough arguments.'
  }.freeze

  UNKNOWN = {
      code:500,
      message: 'Unknown server error.'
  }.freeze

  INVALID_STATE = {
      code: 501,
      message: 'Invalid server state.'
  }.freeze
end
