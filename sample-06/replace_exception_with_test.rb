# Before
class ResourceStack
  def pop
    # raise EmptyStackError if @available.nil?
    # do something
  end
end

class ResourcePool
  def initialize
    @available = ResourceStack.new
    @allocated = ResourceStack.new
  end

  def resource
    begin
      result = @available.pop
      @allocated.push(result)
    rescue EmptyStackError
      result = Resource.new
      @allocated.push(result)
    ensure
      result
    end
  end
end

# After
class ResourceStack
  def pop
    # do something
  end
end

class ResourcePool
  def initialize
    @available = ResourceStack.new
    @allocated = ResourceStack.new
  end

  def resource
    if @available.nil?
      result = Resource.new
    else
      result = @available.pop
    end
    @allocated.push(result)
    result
  end
end
