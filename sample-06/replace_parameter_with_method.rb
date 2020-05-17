# Before
def price
  base_price = @quantity * @item_price
  level_of_discount = 1
  level_of_discount = 2 if @quantity > 100
  discounted_price(base_price, level_of_discount)
end

def discounted_price(base_price, level_of_discount)
  return base_price * 0.1 if level_of_discount == 2
  base_price * 0.05
end

# After
def price
  discounted_price
end

def discount_level
  return 2 if @quantity > 100
  1
end

def base_price
  @quantity * @item_price
end

def discounted_price
  return base_price * 0.1 if discount_level == 2
  base_price * 0.05
end
