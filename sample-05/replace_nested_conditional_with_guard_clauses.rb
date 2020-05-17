# Sample 1
# Before
def pay_amount
  if @dead
    result = dead_amount
  else
    if @separated
      result = separated_amount
    else
      if @retired
        result = retired_amount
      else
        result = normal_pay_amount
      end
    end
  end
  result
end

# After
def pay_amount
  return dead_amount if @dead
  return separated_amount if @separated
  return retired_amount if @retired
  normal_pay_amount
end

# Sample 2
# Before
def adjusted_capital
  result = 0.0
  if @capital > 0.0
    if @interest_rate > 0.0 && @duration > 0.0
      result = (@income / @duration) * ADJ_FACTOR
    end
  end
  result
end

# After
def adjusted_capital
  return 0.0 if @capital <= 0.0
  return 0.0 if !(@interest_rate > 0.0 && @duration > 0.0)
  (@income / @duration) * ADJ_FACTOR
end
