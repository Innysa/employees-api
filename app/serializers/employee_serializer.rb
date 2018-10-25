class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :active
  belongs_to :department, serializer: DepartmentSerializer
end
