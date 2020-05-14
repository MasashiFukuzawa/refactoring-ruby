# Before
class Course
  def initialize(name, advanced)
    @name = name
    @advanced = advanced
  end
end

class Person
  attr_accessor :courses
end

kent = Person.new
courses = []
courses << Course.new('Programing', false)
courses << Course.new('English', true)
kent.courses = courses
assert_equal 2, kent.courses.size
refactoring = Course.new('Refactoring', true)
kent.courses << refactoring
oop = Course.new('OOP', true)
kent.courses << oop
assert_equal 4, kent.courses.size
kent.courses.delete(refactoring)
assert_equal 3, kent.courses.size
number_of_advanced_course = kent.courses.select { |course| course.advanced? }.size

# After
class Course
  def initialize(name, advanced)
    @name = name
    @advanced = advanced
  end
end

class Person
  def initialize
    @courses = []
  end

  def courses
    @courses.dup
  end

  def initialize_courses(courses)
    raise 'Courses should be empty' unless @courses.empty?
    @courses += courses
  end

  def add_course(course)
    @courses << course
  end

  def remove_course(course)
    @courses.delete(course)
  end

  def number_of_advanced_course
    @courses.select { |course| course.advanced? }.size
  end

  def number_of_course
    @courses.size
  end
end

kent = Person.new
kent.add_course(Course.new('Programing', false))
kent.add_course(Course.new('English', true))
assert_equal 2, kent.number_of_course
refactoring = Course.new('Refactoring', true)
kent.add_course(refactoring)
kent.add_course(Course.new('OOP', true))
assert_equal 4, kent.number_of_course
kent.remove_course(refactoring)
assert_equal 3, kent.number_of_course
number_of_advanced_course = kent.number_of_advanced_course
