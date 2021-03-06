# Before
class Order
  attr_accessor :customer

  # Type of customer is string.
  def initialize(customer)
    @customer = customer
  end
end

# After
class Order
  def initialize(customer_name)
    @customer = Customer.new(customer_name)
  end

  def customer_name
    @customer.name
  end

  def customer=(customer_name)
    @customer = Customer.new(customer_name)
  end
end

class Customer
  attr_reader :name

  def initialize(name)
    @name = name
  end
end
