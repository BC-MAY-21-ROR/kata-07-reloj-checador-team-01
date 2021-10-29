module EmployeesHelper
  def assign_employee_creator(employee, creator)
    employee.user = creator
    employee
  end
end
