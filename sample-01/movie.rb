require './price/regular_price'
require './price/new_release_price'
require './price/children_price'

class Movie
  attr_reader :title
  attr_accessor :price

  def initialize(title, price)
    @title = title
    @price = price
  end

  def charge(days_rented)
    @price.charge(days_rented)
  end

  def frequent_renter_points(days_rented)
    @price.frequent_renter_points(days_rented)
  end
end
