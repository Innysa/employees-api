module Response
  def json_response(object, status = :ok, included_items = {})
    render json: object, status: status, include: included_items
  end
end