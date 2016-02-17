gem 'minitest', '>= 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/complete_me'
require_relative '../lib/node'


class CompleteMeTest < Minitest::Test

attr_reader :cm

def setup
  @cm = CompleteMe.new
end

def test_if_complete_me_exists
  assert_equal cm, cm
end

def test_root_is_created_when_trie_is_made
  assert cm.root
end

def test_root_has_nil_children_when_intialized
  assert_equal Hash.new, cm.root.children
end

def test_root_has_false_valie_when_initialized
  refute cm.root.word_end
end

def test_insert_takes_each_characters_and_adds_each_letter_into_the_trie
  word = "Dog"
  cm.insert_word(word)
  assert cm.root.children.include?("d")
  current_node = cm.root.children[word[0].downcase]
  assert current_node.children.include?("o")
  current_node = current_node.children[word[1]]
  assert current_node.children.include?("g")
end

def test_last_letter_in_word_is_flagged_to_signify_that_letter_signifies_end_of_word
  word = "Dog"
  cm.insert_word(word)
  current_node = cm.root.children[word[0].downcase]
  current_node = current_node.children[word[1]]
  current_node = current_node.children[word[2]]
  assert current_node.word_end
end

def test_can_count_amount_of_words_inserted_into_the_tree
  cm.insert_word("dog")
  cm.insert_word("cat")
  cm.insert_word("bat")
  cm.insert_word("cow")
  assert_equal 4, cm.count
end

def test_load_adds_all_words_into_the_tree
  cm = CompleteMe.new
  assert_equal "You've inserted 10 words!", cm.load("sample_words.txt")
end
end
