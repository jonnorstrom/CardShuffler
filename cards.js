const makeDeck = () => [...Array(52).keys()]

let deck = makeDeck();

var first_half = function(deck) {
  return deck.slice(null, (deck.length/2))
}

var second_half = function(deck) {
  return deck.slice(-(deck.length/2))
}

var shuffleDeck = function(deck) {
  var firstHalf = first_half(deck);
  var secondHalf = second_half(deck);
  forEachIn(secondHalf, firstHalf, spliceIntoArray);
  return firstHalf;
}

function spliceIntoArray(array, value, index) {
  // can't splice last card because it goes at end of array
  if (array[index] === undefined) {
    array.push(value);
  } else {
    array.splice(index, 0, value)
  }
}

function forEachIn(secondHalf, firstHalf, action) {
  for (i = 1; i <= firstHalf.length; i += 2) {
    action(firstHalf, secondHalf.shift(), i)
  }
}

// continuous_shuffle recursive until it comes back to original state
function continuousShuffle(originalDeck, shuffledDeck, shuffleCount) {
  if (JSON.stringify(originalDeck) === JSON.stringify(shuffledDeck)) {
    return shuffleCount
  }
  return continuousShuffle(originalDeck, shuffleDeck(shuffledDeck), shuffleCount+=1)
}

console.log(continuousShuffle(deck, shuffleDeck(deck), 1))
