## run this to see how many times you must shuffle a deck
## until it returns back to it's original state
require_relative 'deck'

new_deck = Deck.new
split_deck_array = new_deck.split_deck_perfect
new_deck.stack = new_deck.shuffle(split_deck_array)

# p shuffled_deck.continuous_shuffle(new_deck, shuffled_deck, 1)
