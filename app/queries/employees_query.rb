class EmployeesQuery < BaseQuery
  attr_accessor :page, :per_page, :search

  def initialize(params)
    attr_setter params, :page, :per_page, :search
  end

  def result_query
    result = Employee.includes(:department)
    return perform_search(result) if search.present?
    result
  end

  private

  def perform_search(result)
    result.simple_search(search, pattern: :beginning)
  end
end
