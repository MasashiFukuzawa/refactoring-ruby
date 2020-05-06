# Before
managers = []
employees.each do |e|
  managers << e if e.manager?
end

# After
employees.select { |e| e.manager? }
