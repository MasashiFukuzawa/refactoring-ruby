# Before
class MountainBike
  def initialize(params)
    params.each { |k, v| instance_value_set "@#{k}", v}
  end

  def off_road_ability
    result = @tire_width * TIRE_WITH_FACTOR
    if @type_code == :front_suspension || @type_code == :full_suspension
      result += @front_fork_travel * FRONT_SUSPENSION_FACTOR
    end
    result
  end

  def price
    case @type_code
    when :rigid
      (1 + @commission) * @base_price
    when :front_suspension
      (1 + @commission) * @base_price + @front_suspension_price
    when :full_suspension
      (1 + @commission) * @base_price + @front_suspension_price + @rear_suspension_price
    end
  end
end

bike = MountainBike.new(
  type_code: :front_suspension,
  tire_width: 2,
  front_fork_travel: 3
)

# After
class RigidMountainBike
  include MountainBike

  def initialize(params)
    params.each { |k, v| instance_value_set "@#{k}", v}
  end

  def off_road_ability
    @tire_width * TIRE_WITH_FACTOR
  end

  def price
    (1 + @commission) * @base_price
  end
end

class FrontSuspensionMountainBike
  include MountainBike

  def initialize(params)
    params.each { |k, v| instance_value_set "@#{k}", v}
  end

  def off_road_ability
    @tire_width * TIRE_WITH_FACTOR +
      @front_fork_travel * FRONT_SUSPENSION_FACTOR
  end

  def price
    (1 + @commission) * @base_price + @front_suspension_price
  end
end

class FullSuspensionMountainBike
  include MountainBike

  def initialize(params)
    params.each { |k, v| instance_value_set "@#{k}", v}
  end

  def off_road_ability
    @tire_width * TIRE_WITH_FACTOR +
      @front_fork_travel * FRONT_SUSPENSION_FACTOR +
        @rear_fork_travel * REAR_SUSPENSION_FACTOR
  end

  def price
    (1 + @commission) * @base_price + @front_suspension_price + @rear_suspension_price
  end
end

module MountainBike
  def wheel_circumference
    Math::PI * (@wheel_diameter + @tire_diameter)
  end
end

bike = FrontSuspensionMountainBike.new(
  type_code: :front_suspension,
  tire_width: 2,
  front_fork_travel: 3
)
