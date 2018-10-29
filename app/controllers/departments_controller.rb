class DepartmentsController < ApplicationController
  def index
    @departments = Department.all
    render json: @departments, serializer: ActiveModel::Serializer::CollectionSerializer
  end
end
