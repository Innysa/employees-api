class Employee < ApplicationRecord
	include RubySimpleSearch
  simple_search_attributes :name

	belongs_to :department
end
