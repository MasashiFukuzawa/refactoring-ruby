# Before
class MountainBike
  def initialize(params)
    set_state_from_hash(params)
  end

  def add_front_suspension(params)
    self.type_code = :front_suspension
    set_state_from_hash(params)
  end

  def add_rear_suspension(params)
    unless @type_code == :front_suspension
      raise "You can't add rear suspension unless you have front suspension."
    end
    self.type_code = :full_suspension
    set_state_from_hash(params)
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

  private

    def set_state_from_hash(hash)
      @base_price = hash[:base_price] if hash.has_key?(:base_price)
      @front_suspension_price = hash[:front_suspension_price] if hash.has_key?(:front_suspension_price)
      @rear_suspension_price = hash[:rear_suspension_price] if hash.has_key?(:rear_suspension_price)
      @commission = hash[:commission] if hash.has_key?(:commission)
      @tire_width = hash[:tire_width] if hash.has_key?(:tire_width)
      @front_fork_travel = hash[:front_fork_travel] if hash.has_key?(:front_fork_travel)
      @rear_fork_travel = hash[:rear_fork_travel] if hash.has_key?(:rear_fork_travel)
      self.type_code = hash[:type_code] if hash.has_key?(:type_code)
    end
end

# After
class MountainBike
  extend Forwardable
  def_delegators :@bike_type, :off_road_ability, :price

  def initialize(bike_type)
    @bike_type = bike_type
  end

  def add_front_suspension(params)
    unless @bike_type.is_a?(FrontSuspensionMountainBike)
      raise "You can't add rear suspension unless you have front suspension."
    end
    @bike_type = FrontSuspensionMountainBike.new(
      @bike_type.upgrade_parameters.merge(params)
    )
  end

  def add_rear_suspension(params)
    @bike_type = FullSuspensionMountainBike.new(
      @bike_type.upgrade_parameters.merge(params)
    )
  end
end

class RigidMountainBike
  def initialize(params)
    @tire_width = params[:tire_width]
  end

  def upgrade_parameters
    {
      tire_width: @tire_width,
      base_price: @base_price,
      commission: @commission,
    }
  end

  def off_road_ability
    @tire_width * MountainBuke::TIRE_WITH_FACTOR
  end

  def price
    (1 + @commission) * @base_price
  end
end

class FrontSuspensionMountainBike
  def initialize(params)
    @tire_width = params[:tire_width]
    @front_fork_travel = params[:front_fork_travel]
  end

  def upgrade_parameters
    {
      tire_width: @tire_width,
      front_fork_travel: @front_fork_travel,
      front_suspension_price: @front_suspension_price,
      base_price: @base_price,
      commission: @commission,
    }
  end

  def off_road_ability
    @tire_width * MountainBike::TIRE_WITH_FACTOR +
      @front_fork_travel * MountainBike::FRONT_SUSPENSION_FACTOR
  end
end

class FullSuspensionMountainBike
  def initialize(params)
    @tire_width = params[:tire_width]
    @front_fork_travel = params[:front_fork_travel]
    @rear_fork_travel = params[:rear_fork_travel]
  end

  def off_road_ability
    @tire_width * MountainBike::TIRE_WITH_FACTOR +
      @front_fork_travel * MountainBike::FRONT_SUSPENSION_FACTOR
        + @rear_forl_travel * MountainBike::REAR_SUSPENSION_FACTOR
  end
end
