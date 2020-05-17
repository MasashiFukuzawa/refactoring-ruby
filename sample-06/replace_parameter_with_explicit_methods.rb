# Before
class Employee
  ENGINEER = 0
  SALESPERSON = 1
  MANAGER = 2

  def self.create(type)
    case type
    when ENGINEER
      Engineer.new
    when SALESPERSON
      SalesPerson.new
    when MANAGER
      Manager.new
    else
      raise ArgumantError, 'Incorrect type code value'
    end
  end
end

kent = Employee.create(Employee::Engineer)

# After
class Employee
  def self.create_engineer
    Engineer.new
  end

  def self.create_sales_person
    SalesPerson.new
  end

  def self.create_manager
    Manager.new
  end
end

kent = Employee.create_engineer
