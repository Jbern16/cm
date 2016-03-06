# **CompleteMe**
### **Text auto-completion using a trie data structure**

#### Turing - 1602 - Echo


[![CodeClimate](https://codeclimate.com/github/Jbern16/cm/badges/gpa.svg)](https://codeclimate.com/github/Jbern16/cm)

Travis Testing:
https://travis-ci.org/Jbern16/cm

CompleteMe is a command line word-complete program. Using words you insert yourself or load in, this program will suggest words when given a substring. Further, users can select words for weight so those words are first-in-line to be suggested when the same substring is provided. 

This program uses a trie structure(more here https://en.wikipedia.org/wiki/Trie) to store letters outside of each node. When a substring is provided, the trie retrieves all words that contain the substring, one letter at a time.

## Interaction

All interaction is done inside a irb or pry sessions through the CLI.
I suggest loading the unix internal dictionary so you can start messing around. All interaction is done through the following.

```ruby
# open pry from root project directory
require "./lib/complete_me"

completion = CompleteMe.new

completion.insert("pizza")

completion.count
=> 1

completion.suggest("piz")
=> ["pizza"]

dictionary = File.read("/usr/share/dict/words")

completion.populate(dictionary)

completion.count
=> 235886

completion.suggest("piz")
=> ["pizza", "pizzeria", "pizzicato"]
```

### Usage Weighting

You can select words during this session to prioritize through the following interaction using the select method.

Here's what that interaction model should look like:


```ruby
require "./lib/complete_me"

completion = CompleteMe.new

dictionary = File.read("/usr/share/dict/words")

completion.populate(dictionary)

completion.suggest("piz")
=> ["pizza", "pizzeria", "pizzicato"]

completion.select("piz", "pizzeria")

completion.suggest("piz")
=> ["pizzeria", "pizza", "pizzicato"]
```

This is my first attempt at developing a trie structure. All suggestions welcome! 

Thanks and have fun.

