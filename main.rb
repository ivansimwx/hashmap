require_relative "lib/hash_map"
require_relative "lib/node"
require_relative "lib/linked_list"

# final test
test = HashMap.new
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')
# p test.entries
# p test.length
# p test.capacity

# overwrite some entries
# test.set("jacket", "rainbow")
# test.set("lion", "pale")
# p test.entries
# p test.length
# p test.capacity

# to exceed load factor and grow buckets
test.set('moon', 'silver')
# p test.entries
# p test.length
# p test.capacity

# overwrite some entries
test.set("frog", "brown")
test.set("lion", "green")
p test.entries
p test.length
p test.capacity
p test.keys
p test.values
p test.has?("asds")
p test.get("grape")
p test.remove("banana")
p test.entries
p test.length