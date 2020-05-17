# Before
class Site
  attr_reader :customer
end

class Customer
  attr_reader :name, :plan, :history
end

class PaymentHistory
  def weeks_delinquent_in_last_year
    # return integer
  end
end

customer = site.customer
plan = customer ? customer.plan : BillingPlan.basic
customer_name = customer ? customer.name : 'occupant'
weeks_delinquent = customer.nil? ? 0 : customer.history.weeks_delinquent_in_last_year

# After
class NullCustomer
  def missing?
    true
  end

  def name
    'occupant'
  end

  def plan
    BillingPlan.basic
  end

  def history
    PaymentHistory.new_null
  end
end

class NullPaymentHistory
  def weeks_delinquent_in_last_year
    0
  end
end

class Customer
  def missing?
    false
  end

  def self.new_missing
    NullCustomer.new
  end
end

class Site
  def customer
    @customer = @customer || Customer.new_missing
  end
end

class Customer
  attr_reader :name, :plan, :history
end

class PaymentHistory
  def weeks_delinquent_in_last_year
    # return integer
  end

  def new_null
    NullPaymentHistory.new
  end
end

customer = site.customer
plan = customer.plan
customer_name = customer.name
weeks_delinquent = customer.history.weeks_delinquent_in_last_year
