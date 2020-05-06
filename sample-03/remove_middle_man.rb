# Before
class Person
  attr_reader :name

  def initialize(name, department)
    @name = name
    @department = department
  end

  def manager
    @department.manager
  end
end

class Department
  attr_reader :manager

  def initialize(manager)
    @manager = manager
  end
end

# Image of use
manager = john.manager

# After
class Person
  attr_reader :name, :department

  def initialize(name, department)
    @name = name
    @department = department
  end
end

class Department
  attr_reader :manager

  def initialize(manager)
    @manager = manager
  end
end

# Image of use
manager = john.department.manager
