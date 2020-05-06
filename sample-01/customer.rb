require './movie'

class Customer
  attr_reader :name

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    total_amount = 0
    frequent_renter_points = 0
    result = "Rental record for #{@name}\n"

    @rentals.each do |element|
      frequent_renter_points += 1
      if element.movie.days_rented == Movie.NEW_RELEASE && element.days_rented > 1
        frequent_renter_points += 1
      end

      result += "\t#{element.movie.title}\t#{element.charge.to_s}\n"
      total_amount += element.charge
    end

    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end
end