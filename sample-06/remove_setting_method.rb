# Before
class Account
  def initialize(id)
    self.id = id
  end

  def id=(value)
    @id = value
  end
end

# After
class Account
  def initialize(id)
    initialize_id(id)
  end

  def initialize_id(value)
    @id = "ZZ#{value}"
  end
end
