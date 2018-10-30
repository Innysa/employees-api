class EmployeesController < ApplicationController
	before_action :set_employee, only: [:show, :update, :destroy]

  def index
    @employees = EmployeesQuery.new(params).perform!
    render json: @employees[:result], serializer: ActiveModel::Serializer::CollectionSerializer, include: :department, meta: { total: @employees[:count] }
  end

  def create
    @employee = Employee.create!(employee_params)
    json_response(@employee, :created, :department)
  end

  def show
    json_response(@employee, :ok, :department)
  end

  def update
    @employee.update(employee_params)
    head :no_content
  end

  def destroy
    @employee.destroy
    head :no_content
  end

  private

  def employee_params
    deserialize(params)
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end
end
