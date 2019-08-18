//
//  Concentration.swift
//  Concentration
//
//  Created by Elias Volonakis on 2019-08-08.
//  Copyright © 2019 Elias Volonakis. All rights reserved.
//

import Foundation

struct Concentration
{
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            let faceUpCardIndices = cards.indices.filter { cards[$0].isFaceUp }
            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // Check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        func shuffle() {
            for i in 0..<cards.count {
//                for j in 0..<cards.count {
                cards.swapAt(i.arc4random, i.arc4random)
//                }
//                if i == 0, i + 5 < cards.count {
//                  swap(&cards[i.arc4random], &cards[i.arc4random])
//                    swap(&cards[i+1], &cards[i+3])
//                    swap(&cards[i], &cards[i+3])
//                } else if i + 7 > cards.count {
//                   swap(&cards[i], &cards[i+5])
//                    swap(&cards[i+3], &cards[i+7])
//                    swap(&cards[i+2], &cards[i+6])
//               } else if i + 3 > cards.count {
//                    swap(&cards[i+1], &cards[i+3])
//                    swap(&cards[i+2], &cards[i])
//                } else {
//                   swap(&cards[i], &cards[i-5])
//                    swap(&cards[i-3], &cards[i-1])
//                    swap(&cards[i-4], &cards[i-2])
//                }
        }
    }
}
}

