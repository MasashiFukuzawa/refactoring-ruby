# Before
def print_owing
  outstanding = 0.0

  puts '*************************'
  puts '***** Customer Owes *****'
  puts '*************************'

  @orders.each do |order|
    outstanding += order.amount
  end

  puts "name: #{@name}"
  puts "amount: #{outstanding}"
end

# After
def print_owing
  print_banner
  outstanding = calculate_outstanding(0.0)
  print_details(outstanding)
end

def print_banner
  puts '*************************'
  puts '***** Customer Owes *****'
  puts '*************************'
end

def calculate_outstanding(initial_value)
  @orders.inject(initial_value) { |result, order| result + order.amount }
end

def print_details(outstanding)
  puts "name: #{@name}"
  puts "amount: #{outstanding}"
end
