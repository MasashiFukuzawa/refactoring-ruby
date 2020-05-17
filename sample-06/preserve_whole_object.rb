# Before
class Room
  def within_plan?(plan)
    low = days_temparature_range.low
    high = days_temparature_range.high
    plan.within_range?(low, high)
  end
end

class HeatingPlan
  def within_range?(low, high)
    low >= @range.low && high <= @range.high
  end
end

# After
class Room
  def within_plan?(plan)
    plan.within_range?(days_temparature_range)
  end
end

class HeatingPlan
  def within_range?(room_temparature_range)
    @range.include?(room_temparature_range)
  end
end

class TempRange
  def include?(temparature_range)
    temparature_range.low >= low && temparature_range.high <= high
  end
end
