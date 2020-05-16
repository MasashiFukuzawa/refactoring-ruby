# Before
class Employee
  def emails
    @emails ||= []
  end

  def voide_emails
    @voice_emails ||= []
  end
end

# After
class Employee
  attr_reader :emails, :voice_emails

  def initialize
    @emails = []
    @voice_emails = []
  end
end
