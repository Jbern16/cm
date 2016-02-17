class Node

  attr_accessor :children, :word_end

  def initialize
    @word_end = false
    @children = Hash.new
  end
end
