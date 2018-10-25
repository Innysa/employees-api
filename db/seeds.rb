unless Department.exists?
	10.times.each do |i|
	  Department.create(name: "Department #{i}")
	end
end

unless Employee.exists?
	15.times.each do |i|
	  Employee.create(
	  	name: "#{i} -- EmployeeName", 
	  	active: (i%2 == 0 ? true : false), 
	  	department_id:  Random.rand(9)
	  )
	end
end