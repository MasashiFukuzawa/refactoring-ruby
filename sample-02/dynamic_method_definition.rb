# Before
def faiilure
  self.state = :faiilure
end

def error
  self.state = :error
end

def success
  self.state = :success
end

# After
# -----------------------------------------------
# Sample 1
def_each(:faiilure, :error, :success) do |method_name|
  self.state = method_name
end

class Class
  def def_each(*method_names, &block)
    method_names.each do |method_name|
      define_method(method_name) do
        instance_exec(method_name, &block)
      end
    end
  end
end
# -----------------------------------------------
# Sample 2
class Post
  class << self
    def states(*args)
      args.each do |arg|
        define_method arg do
          state = arg
        end
      end
    end
  end

  state :faiilure, :error, :success
end
# -----------------------------------------------