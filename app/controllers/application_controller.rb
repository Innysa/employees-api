class ApplicationController < ActionController::API
	# include ExceptionHandler
	include Response

  def deserialize(item)
    ActiveModelSerializers::Deserialization.jsonapi_parse(item)
  end
end
