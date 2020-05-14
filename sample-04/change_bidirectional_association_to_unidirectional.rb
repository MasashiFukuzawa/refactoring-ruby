# Before
class Order
  attr_reader :customer

  def customer=(value)
    customer.friend_orders.substract(self) unless customer.nil?
    @customer = value
    customer.friend_orders.add(self) unless customer.nil?
  end
end

require 'set'

class Customer
  def initialize
    @orders = Set.new
  end

  def friend_orders
    @orders
  end

  def add_order(order)
    order.add_customer = self
  end
end

# After
class Order
  def discounted_price(customer)
    gross_price * (1 - customer.discount)
  end
end

require 'set'

class Customer
  def initialize
    @orders = Set.new
  end

  def friend_orders
    @orders
  end

  def add_order(order)
    order.add_customer = self
  end

  def price_for(order)
    assert { @orders.include?(order) }
    order.discounted_price(self)
  end
end
