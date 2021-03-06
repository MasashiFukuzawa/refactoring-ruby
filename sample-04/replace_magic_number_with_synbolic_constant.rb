# Before
def potential_energy(mass, height)
  mass * 9.81 * height
end

# After
GRAVITATIONAL_CONSTANT = 9.81

def potential_energy(mass, height)
  mass * GRAVITATIONAL_CONSTANT * height
end
