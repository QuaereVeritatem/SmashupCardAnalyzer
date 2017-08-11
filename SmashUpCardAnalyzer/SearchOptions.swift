//
//  SearchOptions.swift
//  SmashUpCardAnalyzer
//
//  Created by Robert Martin on 7/12/17.
//  Copyright © 2017 Robert Martin. All rights reserved.
//

import Foundation

class SearchOptions {
    //only one instance can be created [singleton]
    static let sharedInstance = SearchOptions()

    let options: [String] = [" ", "Ongoing", "Talent", "Special", "Top Minion", "Top Action", "Kill A Minion", "Move A Minion", "Extra Minion", "Extra Action", "Control A Minion", "Play From Discard Pile", "VP"]
    

    
    
}

