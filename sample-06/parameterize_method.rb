# Sample 1
# Before
class Employee
  def ten_percent_raise
    @salary *= 1.1
  end

  def five_percent_raise
    @salary *= 1.05
  end
end

# After
class Employee
  def raise(factor)
    @salary *= (1 + factor)
  end
end

# Sample 2
# Before
def base_charge
  result = [last_usage, 100].min * 0.03

  if last_usage > 100
    result += ([last_usage, 200].min - 100) * 0.05
  end

  if last_usage > 200
    result += (last_usage - 200) * 0.07
  end

  Doller.new(result)
end

def last_usage
  # do something
end

# After
def base_charge
  result = usage_range(0..100) * 0.03
  result +=
  result += usage_range(200..last_usage) * 0.07
  Doller.new(result)
end

def last_usage
  # do something
end

def usage_range(range)
  if last_usage > range.begin
    [last_usage, range.end].min - range.begin
  else
    0
  end
end
