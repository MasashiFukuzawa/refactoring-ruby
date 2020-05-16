# Sample 1
# Before
class Employee
  attr_reader :emails, :voice_mails

  def initialize
    @mails = []
    @voice_mails = []
  end
end

# After
class Employee
  def mails
    @mails ||= []
  end

  def voice_mails
    @voice_mails ||= []
  end
end

# Sample 2
# Before
class Employee
  def initialize
    @assistant = Employee.find_by_boss_id(self.id)
  end
end

# After
class Employee
  def assistant
    unless instance_value_defined? :@assistant
      @assistant = Employee.find_by_boss_id(self.id)
    end
    @assistant
  end
end
