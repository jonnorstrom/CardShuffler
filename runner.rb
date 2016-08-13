## run this to see how many times you must shuffle a deck
## until it returns back to it's original state
require_relative 'cards'
p continuous_shuffle(make_deck, shuffle(make_deck), 1)
