# Before
class Person
  attr_reader :department

  def initialize(department)
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

# After
# ----------------------------------
# Sample 1
class Person
  def initialize(department)
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

# ----------------------------------
# Sample 2
class Person
  extend Forwardable

  def_delegator :@department, :manager

  def initialize(department)
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
manager = john.manager
# ----------------------------------
