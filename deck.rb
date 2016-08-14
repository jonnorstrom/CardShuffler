require_relative 'card'

class Deck
  attr_accessor :stack

  def initialize
    @stack = make_deck
  end

  def split_deck_imperfect
    halfway = [23, 24, 25, 26, 27].sample
    new_deck_halves = []
    new_deck_halves << stack[0..halfway]
    new_deck_halves << stack[halfway+1..-1]
    new_deck_halves
  end

  def split_deck_perfect
    new_deck_halves = []
    new_deck_halves << stack[0..25]
    new_deck_halves << stack[26..-1]
    new_deck_halves
  end

  ## does a 'perfect' shuffle on the deck
  def shuffle(deck_halves)
    first_half = deck_halves[0]
    second_half = deck_halves[1]

    new_deck = []

    while !first_half.empty? || !second_half.empty?
      new_deck << first_half.shift unless first_half.empty?
      new_deck << second_half.shift unless second_half.empty?
    end
    new_deck
  end

  def continuous_shuffle(organized_deck, new_deck, count)
    ## pretty_print(new_deck) ## optional!
    return count if new_deck == organized_deck
    continuous_shuffle(organized_deck, shuffle(new_deck), count+1)
  end


  private

  def make_deck
    ranks = %w{A 2 3 4 5 6 7 8 9 10 J Q K}
    suits = %w{hearts clubs diamonds spades}
    stack = []

    suits.map do |suit|
      ranks.size.times do |i|
        stack << Card.new(ranks[i], suit, i+1) ## for the pretty_print method
      end
    end
    stack
  end
end
