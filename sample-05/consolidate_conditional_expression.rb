# Before
def disability_amount
  return 0 if @seniority < 2
  return 0 if @months_disabled < 12
  return 0 if @is_part_time
  # do something
end

# After
def disability_amount
  return 0 if ineligible_for_disability?
  # do something
end

def ineligible_for_disability?
  @seniority < 2 || @months_disabled < 12 || @is_part_time
end
