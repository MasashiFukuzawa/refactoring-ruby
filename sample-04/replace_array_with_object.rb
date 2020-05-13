# Before
row = []
row[0] = 'Liverpool'
row[1] = '15'

name = row[0]
wins = row[1].to_i

# After
class Performance
  attr_accessor :name
  attr_writer :wins

  def initialize
    @data = []
  end

  def wins
    @wins.to_i
  end
end

row = Performance.new
row.name = 'Liverpool'
row.wins = '15'
name = row.name
wins = row.wins
