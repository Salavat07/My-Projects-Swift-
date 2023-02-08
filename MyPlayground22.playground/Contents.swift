import UIKit

class MemoryGame {
  
  // The cards in the game
  private var cards = [Card]()
  
  // The currently selected cards
  private var selectedCards = [Card]()
  
  // The number of pairs of cards in the game
  private let numberOfPairs: Int
  
  // Initializes the memory game with a given number of pairs of cards
  init(numberOfPairs: Int) {
    self.numberOfPairs = numberOfPairs
    
    // Generate the cards
    for _ in 0..<numberOfPairs {
      let card = Card()
      cards += [card, card]
    }
    
    // Shuffle the cards
    cards.shuffle()
  }
  
  // MARK: - Game logic
  
  // Called when a card is selected
  func selectCard(_ card: Card) {
    // If the card is already matched, ignore it
    if card.isMatched {
      return
    }
    
    // If the card is already selected, deselect it
    if let index = selectedCards.firstIndex(of: card) {
      selectedCards.remove(at: index)
      return
    }
    
    // If there are already two cards selected, deselect them and return
    if selectedCards.count == 2 {
      selectedCards.removeAll()
      return
    }
    
    // Otherwise, add the card to the list of selected cards
    selectedCards += [card]
    
    // If there are now two cards selected, check if they match
    if selectedCards.count == 2 {
      if selectedCards[0].id == selectedCards[1].id {
        selectedCards[0].isMatched = true
        selectedCards[1].isMatched = true
      }
      selectedCards.removeAll()
    }
  }
  
  // MARK: - Accessors
  
  var numberOfCards: Int {
    return cards.count
  }
  
  func card(at index: Int) -> Card {
    return cards[index]
  }
}

class Card {
  
  // A unique ID for each card
  let id: Int
  
  // Whether the card is currently matched
  var isMatched = false
  
  // Generates a unique ID for each card
 
