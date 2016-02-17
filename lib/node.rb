class Node

  attr_accessor :children, :value

  def initialize
    @value = false
    @children = Hash.new
  end
end
