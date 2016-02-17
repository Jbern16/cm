require_relative 'node'

class CompleteMe

  attr_reader :root

  def initialize
    @root= Node.new
  end

  def insert_word(word, n=0,current_node=@root)
    word = word.downcase
    unless current_node.children.include?(word[n])
      current_node.children[word[n]] = Node.new
      flag_word(word, n, current_node)
      insert_word(word, n+1, current_node.children[word[n]]) if n < word.length -1
    else
      insert_word(word, n+1, current_node.children[word[n]]) if n < word.length - 1
    end
  end

  def flag_word(word, n, current_node)
    if word[n] == word[-1]
      current_node.children[word[n]].value = true
    end
  end
end
