gem 'minitest', '>= 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/node'


class NodeTest < Minitest::Test

  def test_node_exists
    node = Node.new
    assert_equal node, Node.new
  end

  def test_node_has_default_value_of_false
    node = Node.new
    refute node.word_end
  end

  def test_node_has_default_children_of_empty_hash
    node = Node.new
    assert_equal nil, node.children
  end

end
