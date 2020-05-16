# Before
class Person
end

class Female < Person
  def female?
    true
  end

  def code
    'F'
  end
end

class Male < Person
  def female?
    false
  end

  def code
    'M'
  end
end

# After
class Person
  attr_reader :code

  def initialize(female, code)
    @female = female
    @code = code
  end

  def female?
    @female
  end

  def self.create_female
    Person.new(true, 'F')
  end

  def self.create_male
    Person.new(false, 'M')
  end
end
