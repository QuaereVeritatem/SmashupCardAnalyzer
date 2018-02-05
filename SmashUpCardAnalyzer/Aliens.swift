//
//  Aliens.swift
//  SmashUpCardAnalyzer
//
//  Created by Robert Martin on 2/4/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import Foundation

// this will be all the Minion names for the Aliens faction
enum MinionName :String {
  case SupremeOverlord = "Supreme Overlord"
  case Invader = "Invader"
  case Scout = "Scout"
  case Collector = "Collector"
  
  func showminion() ->String { return self.rawValue }
}

// this will be all the Minion Abilities for the Aliens faction
enum MinionAbility :String {
  case SupremeOverlord = "You may return a minion to its owner’s hand."
  case Invader = "Gain 1 VP."
  case Scout = "Special: After this base is scored, you may place this minion into your hand instead of the discard pile."
  case Collector = "You may return a minion of power 3 or less on this base to its owner’s hand."
  
  func showminion() ->String { return self.rawValue }
}

// this will be all the Minion Power levels for the Aliens faction
enum MinionPower : IntegerLiteralType {
  case SupremeOverlord = 5
  case Invader = 3
  // case Scout = 3  enums have to have unique cases : (
  case Collector = 2
  
  func showminion() -> IntegerLiteralType { return self.rawValue }
}

// this will be the number of cards for each minion card for the Aliens faction
enum MinionCardFrequency : IntegerLiteralType {
  case SupremeOverlord = 1
  case Invader = 2
   case Scout = 3
  case Collector = 4
  
  func showminion() -> IntegerLiteralType { return self.rawValue }
}



// this will be all the Action names for the Aliens faction
enum ActionName :String {
  case Abduction = "Abduction"
  case BeamUp = "Beam Up"
  case CropCircles = "Crop Circles"
  case Disintegrator = "Disintegrator"
  case Invasion = "Invasion"
  case JammedSignal = "Jammed Signal"
  case Probe = "Probe"
  case Terraforming = "Terraforming"
  
  func showminion() ->String { return self.rawValue }
}

// this will be all the Action Abilities for the Aliens faction
enum ActionAbility :String {
  case Abduction = "Return a minion to its owner’s hand. Play an extra minion."
  case BeamUp = "Return a minion to its owner’s hand."
  case CropCircles = "Choose a base. Return each minion on that base to its owner’s hand."
  case Disintegrator = "Place a minion of power 3 or less on the bottom of its owner’s deck."
  case Invasion = "Move a minion to another base."
  case JammedSignal = "Play on a base. Ongoing: All players ignore this base’s ability."
  case Probe = "Look at another player’s hand and choose a minion in it. That player discards that minion."
  case Terraforming = "Search the base deck for a base. Swap it with a base in play (discard all actions attached to it). Shuffle the base deck. You may play an extra minion on the new base."
  
  func showminion() ->String { return self.rawValue }
}










