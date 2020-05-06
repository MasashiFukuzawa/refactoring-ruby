# Before
class Person
  attr_reader :mother, :children, :name

  def initializer(name, date_of_birth, date_of_death = nil, mother = nil)
    @name = name
    @mother = mother
    @date_of_birth = date_of_birth
    @date_of_death = date_of_death
    @children = []
    @mother.add_children(self) if @mother
  end

  def add_children(child)
    @children << child
  end

  def number_of_living_descendants
    children.inject(0) do |count, child|
      count += 1 if child.alive?
      count + child.number_of_living_descendants
    end
  end

  def number_of_living_descendants_named(name)
    children.inject(0) do |count, child|
      count += 1 if child.name == name
      count + child.number_of_living_descendants_named(name)
    end
  end

  def alive?
    @date_of_death.nil?
  end
end

# After
class Person
  attr_reader :mother, :children, :name

  def initializer(name, date_of_birth, date_of_death = nil, mother = nil)
    @name = name
    @mother = mother
    @date_of_birth = date_of_birth
    @date_of_death = date_of_death
    @children = []
    @mother.add_children(self) if @mother
  end

  def add_children(child)
    @children << child
  end

  def number_of_living_descendants
    count_descendants_matching { |descendant| descendant.alive? }
  end

  def number_of_living_descendants_named(name)
    count_descendants_matching { |descendant| descendant.name == name }
  end

  def alive?
    @date_of_death.nil?
  end

  protected

    def count_descendants_matching(&block)
      children.inject(0) do |count, child|
        count += 1 if yield(child)
        count + child.count_descendants_matching(&block)
      end
    end
end
