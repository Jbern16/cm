require 'pry'
require_relative 'node'

class Trie

  attr_accessor :root, :weights, :word_count

  def initialize
    @root= Node.new
    @word_count = 0
    @weights = Hash.new
  end

  def insert(word, n=0,current_node=@root)
    unless current_node.children.include?(word[n])
      current_node.children[word[n]] = Node.new
      flag_word(word, n, current_node)
      insert(word, n+1, current_node.children[word[n]]) if n < word.length - 1
    else
      insert(word, n+1, current_node.children[word[n]]) if n < word.length - 1
    end
  end

  def flag_word(word, n, current_node)
    if n == word.length - 1
      current_node.children[word[n]].word_end = true
      @word_count += 1
    end
  end

  def populate(file)
    file = file.split("\n").each do |word|
      insert(word)
    end
    "You've inserted #{word_count} words!"
  end

  def suggest(string, current_node=@root)
    unless valid_input?(string)
       return "Invalid Input"
    end
    @suggestions = []
    @word = ""
    tree_nav_to_string_for_suggest(string, current_node)
    unless weights[string] == nil
      weight_suggestions(string)
    else
      @suggestions
    end
  end

  def valid_input?(string)
    all_letters = ("a".."z").to_a
    (string != "")  && (string.chars.all?{|letter| all_letters.include?(letter)})
  end

  def tree_nav_to_string_for_suggest(string, current_node)
    string.each_char do |chr|
      if current_node.children.keys.include?(chr)
        current_node = current_node.children[chr]
      else
        return "Not there"
      end
    end
    create_suggestions(string, current_node)
  end

  def weight_suggestions(string)
      weighted_words = weights[string].sort_by do |word, weight|
        weight end.reverse.flatten.find_all do |e|
        e.class == String end
    weighted_suggestions = weighted_words.concat(@suggestions).uniq
    weighted_suggestions
  end

  def create_suggestions(string, current_node)
    unless current_node.children == {}
      current_node.children.each_key do |letter|
         @word << letter
         @suggestions << (string + @word) if current_node.children[letter].word_end
         create_suggestions(string, current_node.children[letter])
         @word = @word.chop
       end
     end
     @suggestions
  end

  def select(string, word)
    if weights.keys.include?(string)
      weights[string][word] += 1
    else
      weights[string] = Hash.new(0)
      weights[string][word] += 1
    end
  end

end
