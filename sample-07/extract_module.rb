# Before
class Bid
  before_save :capture_account_number

  def capture_account_number
    self.account_number = buyer.preferred_account_number
  end
end

class Sale
  before_save :capture_account_number

  def capture_account_number
    self.account_number = buyer.preferred_account_number
  end
end

# After
module AccountNumberCapture
  def capture_account_number
    self.account_number = buyer.preferred_account_number
  end

  def self.included(klass)
    klass.class_eval do
      before_save :capture_account_number
    end
  end
end

class Bid
  include AccountNumberCapture
end

class Sale
  include AccountNumberCapture
end
