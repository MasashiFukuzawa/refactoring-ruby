# Sample 1
# Before
parameters = params ? params : []

# After
parameters = params || []

# Sample2
# Before
def reward_points
  if days_rented > 2
    2
  else
    1
  end
end

# After
parameters = params || []
def reward_points
  return 2 if days_rented > 2
  1
end
