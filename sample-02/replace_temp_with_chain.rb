# Before
class Select
  def options
    @options ||= []
  end

  def add_option(arg)
    @options << arg
  end
end

select = Select.new
select.add_option(1999)
select.add_option(2000)
select.add_option(2001)
select.add_option(2002)

# After
class Select
  def options
    @options ||= []
  end

  def and(arg)
    @options << arg
    self
  end

  class << self
    def with_option(option)
      select = new
      select.options << option
      select
    end
  end
end

select = Select.with_option(1999).and(2000).and(2001).and(2002)
