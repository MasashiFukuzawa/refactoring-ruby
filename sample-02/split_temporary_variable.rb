# Before
def distance_traveled(time)
  acc = @primary_force / @mass
  primary_time = [time, @delay].min
  result = 0.5 * acc * primary_time * primary_time
  secondary_time = time - @delay
  if secondary_time > 0
    primary_vel = acc * @delay
    acc = (@primary_force + @secondary_force) / @mass
    result += primary_vel * secondary_time + 0.5 * acc * secondary_time * secondary_time
  end
  result
end

# After
def distance_traveled(time)
  primary_acc = @primary_force / @mass
  primary_time = [time, @delay].min
  result = 0.5 * primary_acc * primary_time * primary_time
  secondary_time = time - @delay
  if secondary_time > 0
    primary_vel = primary_acc * @delay
    secondary_acc = (@primary_force + @secondary_force) / @mass
    result += primary_vel * secondary_time + 0.5 * secondary_acc * secondary_time * secondary_time
  end
  result
end

# Refactoring one step further
def distance_traveled(time)
  primary_acc = calculate_acc(@primary_force)
  result = calculate_distance(primary_acc, primary_time)
  if secondary_time > 0
    secondary_acc = calculate_acc(@primary_force + @secondary_force)
    result += calculate_distance(secondary_acc, secondary_time, primary_vel(primary_acc))
  end
  result
end

def primary_time(time)
  [time, @delay].min
end

def calculate_acc(force)
  @primary_force / @mass
end

def secondary_time(time)
  time - @delay
end

def primary_vel(primary_acc)
  primary_acc * @delay
end

def calculate_distance(acc, time, vel = 0)
  vel * time + 0.5 * acc * time * time
end
