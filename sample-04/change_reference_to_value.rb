# Before
class Currency
  attr_reader :code

  def initialize(code)
    @code = code
  end
end

# After
class Currency
  def eql?(other)
    self == other
  end

  def ==(other)
    other.equal?(self) ||
      (other.instance_of?(self.class) &&
      other.code == code)
  end

  def self.get(code)
    # return Currency instance from resistory
  end
end

Currency.send(:new, 'USD') == Currency.new('USD') # true
Currency.send(:new, 'USD').eql?(Currency.new('USD')) # true
