## makes a deck of cards - standard
def make_deck
  nums = (1..13).to_a
  suits = %w{hearts clubs diamonds spades}
  deck = []

  suits.map do |suit|
    nums.each do |num|
      deck << "#{num.to_s} of #{suit}" ## for the pretty_print method
    end
  end
  deck
end

## gets first half of given deck
def half1(deck)
  deck[0..25]
end

## gets second half of given deck
def half2(deck)
  half2 = deck[26..-1]
end

## does a 'perfect' shuffle on the deck
def shuffle(deck)
  first_half = half1(deck)
  second_half = half2(deck)

  new_deck = []

  while !first_half.empty?
    new_deck << first_half.shift
    new_deck << second_half.shift
  end
  new_deck
end

def pretty_print(deck)
  deck.each do |card|
    puts card
  end
end

## continues to shuffle the deck until the deck returns to it's current state
## must pass along the original deck, the new deck to compare with,
## and the amount of times it's been shuffled
def continuous_shuffle(organized_deck, new_deck, count)
  pretty_print(new_deck) ## optional!
  return count if new_deck == organized_deck
  continuous_shuffle(organized_deck, shuffle(new_deck), count+1)
end


################### some runner code ###################
## let's make our deck here, shuffle it once, and then run the program
