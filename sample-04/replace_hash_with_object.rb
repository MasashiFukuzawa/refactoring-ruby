# Before
new_network = { node: [], old_network: [] }

new_network[:old_network] << node.new_network
new_network[:node] << node

new_network[:name] = new_network[:old_network].collect do |network|
  network.name
end.join(' - ')

# After
class NetworkResult
  attr_reader :old_networks, :nodes

  def initialize
    @old_networks = []
    @nodes = []
  end

  def name
    old_networks.collect { |network| network.name }.join(' - ')
  end
end

new_network = NetworkResult.new
new_network.old_networks << node.network
new_network.nodes << node
new_network.name
