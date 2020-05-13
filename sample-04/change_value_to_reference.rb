# Before
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

# After
class Order
  def initialize(customer_name)
    @customer = Customer.with_name(customer_name)
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

  Instances = {}

  def initialize(name)
    @name = name
  end

  def store
    Instances[name] = self
  end

  class << self
    def with_name(name)
      Instances[name]
    end

    def load_customers
      new('Lemon Car Hire').store
      new('Associated Coffee Machines').store
      new('Bilston Gasworks').store
    end
  end
end
