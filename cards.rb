## makes a deck of cards - standard
def make_deck
  nums = [*1..13]
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
  splice(half1(deck), half2(deck))
end

def splice(first_half, second_half)
  i = 1
  while second_half[0] do
    first_half.insert(i, second_half.shift)
    i += 2
  end
  first_half
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
  ## pretty_print(new_deck) ## optional!
  return count if new_deck == organized_deck
  continuous_shuffle(organized_deck, shuffle(new_deck), count+1)
end
