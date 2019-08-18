//
//  Card.swift
//  Concentration
//
//  Created by Elias Volonakis on 2019-08-08.
//  Copyright © 2019 Elias Volonakis. All rights reserved.
//

import Foundation

struct Card: Hashable
{
    var hashValue: Int { return identifier }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var indentifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        indentifierFactory += 1
        return indentifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}


