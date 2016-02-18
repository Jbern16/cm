require 'pry'
require_relative 'node'

class CompleteMe

  attr_reader :root

  def initialize
    @root= Node.new
    @word_count = 0
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

  def load(file)
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
     @suggestions.select
  end

  def select(string)
    if @suggestions.include?(string)
      @suggestions[0] = string
    end
  end














end
