require 'pry'
require_relative 'node'

class CompleteMe

  attr_accessor :root :weights

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

  def count
    @word_count
  end

  def populate(file)
    content = File.read(file)
    content.split("\n").each do |word|
      insert(word)
    end
    "You've inserted #{count} words!"
  end

  def suggest(string, current_node=@root)
    return "Enter at least 1 letter" if string == ""
    @suggestions = []
    @word = string
    string.each_char do |chr|
      if current_node.children.keys.include?(chr)
        current_node = current_node.children[chr]
      else
        return "Not there"
      end
    end

    suggest_helper(string, current_node)

    sorted_names = []
    unless weights == {}
      weights.each_key do |key|
        weights[key].sort.reverse.flatten.each do |word|
          weights << elements if element.class == String
        end
      end
    end
    temp = temp.uniq
  end

  def suggest_helper(string, current_node)
    unless current_node.children == {}
      current_node.children.each_key do |letter|
         @word << letter
         @suggestions << @word if current_node.children[letter].word_end
         suggest_helper(string, current_node.children[letter])
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
      weights[string] += 1
    end
  end
















end
