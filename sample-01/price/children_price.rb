require './default_price'

class Price::ChildrenPrice
  include Price::DefaultPrice

  def charged(days_rented)
    result = 1.5
    result += (days_rented - 3) * 1.5 if days_rented > 3
    result
  end
end
