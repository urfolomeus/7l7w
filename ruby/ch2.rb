# part 1
class SliceTest
  def initialize
    @a = *(1..16)
    @slices = []
  end

  def without_slice
    slice = []
    @a.each_with_index do |num, i|
      slice << num
      if (i+1) % 4 == 0
        @slices << slice
        slice = []
      end
    end
    self
  end

  def with_slice
    @a.each_slice(4) {|slice| @slices << slice}
    self
  end

  def result
    p @slices
  end
end

SliceTest.new.without_slice.result
SliceTest.new.with_slice.result

# part 2

class Tree
  attr_accessor :children, :node_name, :tree

  def self.from_hash(hash)
    top_node = hash.first
    name, children = top_node.first, top_node.last
    new(name, children)
  end

  def initialize(name, children={})
    @children = children.map {|p, c| Tree.new(p, c)}
    @node_name = name
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

fam_hash = {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } }

family_tree = Tree.from_hash(fam_hash)

puts "*"*20
family_tree.visit {|node| puts node.node_name}
puts "*"*20
family_tree.visit_all {|node| puts node.node_name}

