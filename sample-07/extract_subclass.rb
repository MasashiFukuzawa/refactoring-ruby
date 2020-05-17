# Before
class JobItem
  attr_reader :quantity, :employee

  def initialize(unit_price, quantity, is_labor, employee)
    @unit_price = unit_price
    @quantity = quantity
    @is_labor = is_labor
    @employee = employee
  end

  def total_price
    unit_price * @quantity
  end

  def unit_price
    labor? ? @employee.rate : @unit_price
  end

  def labor?
    @is_labor
  end
end

class Employee
  attr_reader :rate

  def initialize(rate)
    @rate = rate
  end
end

# After
class JobItem
  attr_reader :unit_price

  def initialize(unit_price, quantity)
    @unit_price = unit_price
    @quantity = quantity
  end

  def total_price
    unit_price * @quantity
  end

  protected

    def labor?
      true
    end
end

class LaborItem < JobItem
  attr_reader :employee

  def initialize(quantity, employee)
    super(0, quantity, true)
    @employee = employee
  end

  def unit_price
    @employee.rate
  end
end

class Employee
  attr_reader :rate

  def initialize(rate)
    @rate = rate
  end
end
