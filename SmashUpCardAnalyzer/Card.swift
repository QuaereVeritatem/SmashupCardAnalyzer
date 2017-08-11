//
//  Card.swift
//  SmashUpCardAnalyzer
//
//  Created by Robert Martin on 7/12/17.
//  Copyright © 2017 Robert Martin. All rights reserved.
//

import Foundation

//if we understood protocols better than we probably should switch to that
struct Card {
    
    var factionName: String
    var cardName: String
    //this will be Minion or Action
    var cardType: String
    var powerLevel: Int
    var cardAbility: String
    
    //"All", "Ongoing", "Talent", "Special", "Top Minion", "Top Action", "Kill A Minion", "Move A Minion", "Extra Minion", "Extra Action", "Control A Minion", "Play From Discard Pile", "Gain VP"
    //each card can have multiple keywords
    var keywords: [String] = [""]
    
    
    
}
