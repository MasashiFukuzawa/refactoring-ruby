# Before
module MountainBike
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

class RigidMountainBike
  include MountainBike

  def initialize(type_code:, base_price:, commission:)
    @type_code = type_code
    @base_price = base_price
    @commission = commission
  end
end

class FrontSuspensionMountainBike
  include MountainBike

  def initialize(type_code:, base_price:, commission:)
    @type_code = type_code
    @base_price = base_price
    @commission = commission
  end
end

class FullSuspensionBike
  include MountainBike

  def initialize(type_code:, base_price:, commission:)
    @type_code = type_code
    @base_price = base_price
    @commission = commission
  end
end

rigid_bike = RigidMountainBike.new(
  type_code: :rigid,
  base_price: 300,
  commission: 0.1,
)
total += rigid_bike.price

front_suspension_bike = FrontSuspensionMountainBike.new(
  type_code: :front_suspension,
  base_price: 500,
  commission: 0.15,
)
total += front_suspension_bike.price

# After
module MountainBike
  # do something
end

class RigidMountainBike
  include MountainBike

  def initialize(type_code:, base_price:, commission:)
    @type_code = type_code
    @base_price = base_price
    @commission = commission
  end

  def price
    (1 + @commission) * @base_price
  end
end

class FrontSuspensionMountainBike
  include MountainBike

  def initialize(type_code:, base_price:, commission:)
    @type_code = type_code
    @base_price = base_price
    @commission = commission
  end

  def price
    (1 + @commission) * @base_price + @front_suspension_price
  end
end

class FullSuspensionBike
  include MountainBike

  def initialize(type_code:, base_price:, commission:)
    @type_code = type_code
    @base_price = base_price
    @commission = commission
  end

  def price
    (1 + @commission) * @base_price + @front_suspension_price + @rear_suspension_price
  end
end

rigid_bike = RigidMountainBike.new(
  type_code: :rigid,
  base_price: 300,
  commission: 0.1,
)
total += rigid_bike.price

front_suspension_bike = FrontSuspensionMountainBike.new(
  type_code: :front_suspension,
  base_price: 500,
  commission: 0.15,
)
total += front_suspension_bike.price
