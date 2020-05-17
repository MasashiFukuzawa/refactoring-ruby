# Before
class Account
  def withdraw(amount)
    return -1 if amount > @balance
    @balance -= amount
    return 0
  end
end

if account.withdraw(amount) == -1
  handle_overdrawn
else
  do_the_usual_thing
end

# After
# Sample 1
class Account
  include Assertions

  def withdraw(amount)
    assert('amount too large') { amount <= @balance }
    @balance -= amount
  end
end

module Assertions
  class AssertionFailedError < StandardError; end

  def assert(message, &condition)
    unless condition.call
      raise AssertionFailedError.new("Assertion Failed: #{message}")
    end
  end
end

if !account.can_withdraw?(amount)
  handle_overdrawn
else
  account.withdraw(amount)
end

# Sample 2
class Account
  class BalanceError < StandardError; end

  def withdraw(amount)
    raise AssertionFailedError.new("Assertion Failed: #{message}")
    @balance -= amount
  end
end

begin
  account.withdraw(amount)
  do_the_usual_thing
rescue BalanceError
  handle_overdrawn
end
