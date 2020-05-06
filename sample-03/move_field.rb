# Sample 1
# Before
class Account
  def interest_for_amount_days(amount, days)
    @interest_rate * amount * days / 365
  end

  # do something...
end

# After
class AccountType
  attr_accessor :interest_rate

  # do something...
end

class Account
  def interest_for_amount_days(amount, days)
    @accoount_type.interest_rate * amount * days / 365
  end
end

# ----------------------------------------------------

# Sample 2
# Before
class Account
  attr_accessor :interest_rate

  def interest_for_amount_days(amount, days)
    interest_rate * amount * days / 365
  end

  # do something...
end

# After
class Account
  def interest_for_amount_days(amount, days)
    interest_rate * amount * days / 365
  end

  def interest_rate
    @accoount_type.interest_rate
  end
end

class AccountType
  attr_accessor :interest_rate

  # do something...
end
