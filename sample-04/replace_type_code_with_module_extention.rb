# Before
class MountainBike
  attr_writer :type_code

  def initialize(params)
    @type_code = params[:type_code]
    @commission = params[:commission]
  end

  def off_road_ability
    result = @tire_width * TIRE_WITH_FACTOR
    if @type_code == :front_suspension || @type_code == :full_suspension
      result += @front_fork_travel * FRONT_SUSPENSION_FACTOR
    end
    if @type_code == :full_suspension
      result += @rear_forl_travel * REAR_SUSPENSION_FACTOR
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
class MountainBike
  def type_code=(model)
    extend model
  end

  def off_road_ability
    @tire_width * TIRE_WITH_FACTOR
  end

  def price
    (1 + @commission) * @base_price
  end
end

module FrontSuspensionMountainBike
  def off_road_ability
    @tire_width * TIRE_WITH_FACTOR + @front_fork_travel * FRONT_SUSPENSION_FACTOR
  end

  def price
    (1 + @commission) * @base_price + @front_suspension_price
  end
end

module FullSuspensionMountainBike
  def off_road_ability
    @tire_width * TIRE_WITH_FACTOR +
      @front_fork_travel * FRONT_SUSPENSION_FACTOR +
        @rear_forl_travel * REAR_SUSPENSION_FACTOR
  end

  def price
    (1 + @commission) * @base_price + @front_suspension_price + @rear_suspension_price
  end
end

bike = MountainBike.new
bike.type_code = :front_suspension
