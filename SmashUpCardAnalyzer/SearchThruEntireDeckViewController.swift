//
//  SearchThruEntireDeckViewController.swift
//  SmashUpCardAnalyzer
//
//  Created by Robert Martin on 7/12/17.
//  Copyright © 2017 Robert Martin. All rights reserved.
//

//BUGS** Crash caused by reusing cells in collectionView[dont do counters inside collectionview function]

//classes that need to be updated : Big in Japan (need to be added too)

//actions dont have keywords(so wont work in search for specific cards!!!)

import UIKit

private let reuseIdentifier = "Cell"

class SearchThruEntireDeckViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var factionPicker: UIPickerView!
    
    @IBOutlet weak var cardCollection: UICollectionView!
    
    let choices: [String] = SearchOptions.sharedInstance.options
    
    var cardcount: Int = 0
    
    //this will go up after cardcount goes up to 19 (divide by 19 with mod = 0)
    var factionCount: Int = 0
    
    //this will be the # of minions pulled from the faction minion array count
    var minionCount: Int = 0
    
    //this will be the # of actions pulled from the faction action array count
    var actionCount : Int = 0
    
    //this will be an array of cards (as structs).. represents search results
    var tempSearchResults: [Card] = []
   
    let permClassList: [Faction] = [
        Aliens.sharedInstance, Dinosaurs.sharedInstance, Ninjas.sharedInstance, Pirates.sharedInstance, Robots.sharedInstance, Wizards.sharedInstance, Tricksters.sharedInstance,
        Zombies.sharedInstance, BearCavalry.sharedInstance, Ghosts.sharedInstance, KillerPlants.sharedInstance, SteamPunks.sharedInstance,
        ElderThings.sharedInstance, Innsmouth.sharedInstance, MinionsOfCthulhu.sharedInstance, MiskatonicUniversity.sharedInstance,
        CyborgApes.sharedInstance, Shapeshifters.sharedInstance, SuperSpies.sharedInstance, TimeTravelers.sharedInstance,
        GiantAnts.sharedInstance, Vampires.sharedInstance, MadScientists.sharedInstance, Werewolves.sharedInstance,
        Geeks.sharedInstance, Fairies.sharedInstance, KittyCats.sharedInstance, MythicHorses.sharedInstance,
        Princesses.sharedInstance, Dwarves.sharedInstance, Elves.sharedInstance, Clerics.sharedInstance,
        Halflings.sharedInstance, Mages.sharedInstance, Orcs.sharedInstance, Thieves.sharedInstance, Warriors.sharedInstance, Dragons.sharedInstance,
        MythicGreeks.sharedInstance, Sharks.sharedInstance, SuperHeroes.sharedInstance, Tornados.sharedInstance, AstroKnights.sharedInstance,
        StarRoamers.sharedInstance, ChangerBots.sharedInstance, IgNobles.sharedInstance, Explorers.sharedInstance, Grannies.sharedInstance, RockStars.sharedInstance, TeddyBears.sharedInstance, AllStars.sharedInstance]
    
    
    //This will be a tempstorage of the class that will be diplayed
    var tempClass: [Faction] = [
        Aliens.sharedInstance, Dinosaurs.sharedInstance, Ninjas.sharedInstance, Pirates.sharedInstance, Robots.sharedInstance, Wizards.sharedInstance, Tricksters.sharedInstance,
        Zombies.sharedInstance, BearCavalry.sharedInstance, Ghosts.sharedInstance, KillerPlants.sharedInstance, SteamPunks.sharedInstance,
        ElderThings.sharedInstance, Innsmouth.sharedInstance, MinionsOfCthulhu.sharedInstance, MiskatonicUniversity.sharedInstance,
        CyborgApes.sharedInstance, Shapeshifters.sharedInstance, SuperSpies.sharedInstance, TimeTravelers.sharedInstance,
        GiantAnts.sharedInstance, Vampires.sharedInstance, MadScientists.sharedInstance, Werewolves.sharedInstance,
        Geeks.sharedInstance, Fairies.sharedInstance, KittyCats.sharedInstance, MythicHorses.sharedInstance,
        Princesses.sharedInstance, Dwarves.sharedInstance, Elves.sharedInstance, Clerics.sharedInstance,
        Halflings.sharedInstance, Mages.sharedInstance, Orcs.sharedInstance, Thieves.sharedInstance, Warriors.sharedInstance, Dragons.sharedInstance,
        MythicGreeks.sharedInstance, Sharks.sharedInstance, SuperHeroes.sharedInstance, Tornados.sharedInstance, AstroKnights.sharedInstance,
        StarRoamers.sharedInstance, ChangerBots.sharedInstance, IgNobles.sharedInstance, Explorers.sharedInstance, Grannies.sharedInstance, RockStars.sharedInstance, TeddyBears.sharedInstance, AllStars.sharedInstance]
    
    var newTempClass: [Faction] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in factionPicker: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ factionPicker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return choices[row]
    }
    
    func pickerView(_ factionPicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return choices.count
    }
    
    func pickerView(_ factionPicker: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let chosen = SearchOptions.sharedInstance.options[row]
        cardsToShowFromPicker(choice: chosen)
        
       // performSegue(withIdentifier: "MASegue", sender: chosen)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in cardCollection: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return (tempClass.count * 20) / 4 //Factions.sharedInstance.factionListArray.count -> This is number of factions which is 51
    }
    
    
    func collectionView(_ cardCollection: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 4
    }
    
    func collectionView(_ cardCollection: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cardCollection.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SearchAllCollectionViewCell
        
        cell.backgroundColor = UIColor.black
        // Configure the cell
        //although there are 20 cards at most 10 are minions/ 10 are actions(and this changes for each faction (so you cant use minions or actions for all...)
        
        //we must use if statement that detects what kind of card the next card is and then uses either minions or actions to display label OR...**** see if we can pull count from minions and/or actions
        
        //if minionCount <= Aliens.sharedInstance.minions.count then
        // print all info as a minion (and increment minionCount and cardcount)
        //else print all info as an action (and increment actionCount and cardcount)
        
        

        var loopCount: Int = tempClass[factionCount].minions.count
        
        //if minionCount < count, do it(then add to minionCount) else
        //if action count < count do it(then add to actionCount) else
        //add to factioncount and reset minioncount and actioncount
        
        
        //this is loop for all minions of same faction
        if minionCount < tempClass[factionCount].minions.count {
            cell.powerAndFaction.text = "  \(tempClass[factionCount].minions[minionCount].powerOnCard)" + "    " +  "\(tempClass[factionCount].minions[minionCount].minionName)"
            
            //error on next line..return cardcount to "0" to temp fix
            cell.minionAbility.text = "\(tempClass[factionCount].minions[minionCount].Ability[0].abilityLabel)"
            cell.minionOrActionHeaderLabel.text = "Minion"
            
            minionCount = minionCount + 1
            cardcount = cardcount + 1

        } else {
        
        
            //this is loop for all actions of same faction
            if actionCount < tempClass[factionCount].actions.count {
                cell.powerAndFaction.text = "     \(tempClass[factionCount].actions[actionCount].actionName)"
            
                cell.minionAbility.text = "\(tempClass[factionCount].actions[actionCount].Ability[0].actionCardAbilityName)"
                cell.minionOrActionHeaderLabel.text = "Action"
            
                actionCount = actionCount + 1
                cardcount = cardcount + 1

            } else {
                
                //add to factionCount and reset minionCount and actionCount
                factionCount = factionCount + 1
                actionCount = 0
                minionCount = 0
            }
        }

        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */

    
    //Add keywords var (string array) to every class...its the easiest way
    func convertCardAsClassToStruct(class2Convert: Faction) {
        let factionDeckSize = 20
        
        var factionName: String
        var cardName: String
        //this will be Minion or Action
        var cardType: String
        var powerLevel: Int
        var cardAbility: String
        //"All", "Ongoing", "Talent", "Special", "Top Minion", "Top Action", "Kill A Minion", "Move A Minion", "Extra Minion", "Extra Action", "Control A Minion", "Play From Discard Pile", "Gain VP"
        //each card can have multiple keywords
        var keywords: [String] = [""]

        
        //this will loop for every card so we can convert/strip info from class and put on struct
        //unfortunately not ever class has 10 minions, 10 actions
 /*       for i in 0...factionDeckSize-1 {
            
            if i < 10 {
            factionName.append(class2Convert.factionName)
            //cardName.append(class2Convert.minions)
            cardType.append("Minion")
            //powerLevel =
            //this is either an actions description or the minions ability
            //cardAbility.append(class2Convert.)
            
            //this is where the function goes to search the string to see if its a "talent, special or ongoing"
            //....func then   var keywords =
            } else {
                //i is > 10 so use actionability as label
                factionName.append(class2Convert.factionName)
               // cardName.append(class2Convert.actions)
                cardType.append("Action")
                //powerLevel =
                //this is either an actions description or the minions ability
               // cardAbility.append(<#T##other: String##String#>)
                
                //this is where the function goes to search the string to see if its a "talent, special or ongoing"
                //....func then   var keywords =
                
                
            }
            
            //tempSearchResults(factionName.append(factionName))
            //print (tempSearchResults)
        }
        
        */
    }
    
    func cardsToShowFromPicker(choice: String) {
        //options are ["All", "Ongoing", "Talent", "Special", "Top Minion", "Top Action", "Kill A Minion", "Move A Minion", "Extra Minion", "Extra Action", "Control A Minion", "Play From Discard Pile", "Gain VP"]   //cannot be destroyed would b cool
        
        switch choice {
            case " ":      print("This will be all cards from all factions")
                            creatingTheQueriedSearchClass(pickerchoice: choice)
            case "Ongoing":   print("This will be all cards from all factions which have the keyword 'Ongoing' ")
                            creatingTheQueriedSearchClass(pickerchoice: choice)
            case "Talent":    print("This will be all cards from all factions which have the keyword 'Talent' ")
                            creatingTheQueriedSearchClass(pickerchoice: choice)
            case "Special":   print("This will be all cards from all factions which have the keyword 'Special' ")
                            creatingTheQueriedSearchClass(pickerchoice: choice)
            case "Top Minion": print("This will be the Top Minion(s) from all factions")
            case "Top Action": print("This will be the Top Action(s) from all factions")
            case "Kill A Minion": print("This will be all the cards from all factions which destroy a minion")
            case "Move A Minion": print("This will be all the cards from all factions which move a minion")
            case "Extra Minion": print("This will be all the cards from all factions which allow you to play an extra minion")
            case "Extra Action": print("This will be all the cards from all factions which allow you to play an extra action")
            case "Control A Minion": print("This will be all the cards from all factions which allow you to control a minion")
            case "Play From Discard Pile": print("This will be all the cards from all factions which allow you to play (actions or minions) from the discard pile")
            case "VP": print("This will be all the cards from all factions which allow you to gain VP")
                            creatingTheQueriedSearchClass(pickerchoice: choice)
        default: print("This is in case I forgot something")
        }
        
        
    }
    
    func creatingTheQueriedSearchClass(pickerchoice: String) {
        //problem: Class Faction call only have 1 faction name [make this an array of Faction]
        var tempQClass: [Faction] = []
        
        //loop through every card of every faction to read minion description
        
        //this loops thru every faction...count - 1 is what it should say
        for f in 0...permClassList.count - 1 {
            
            
                //loop for actions and minions, then read ability for key words:compare against pickerchoice
                //next line will empty out minions and actions array so we can add card by card
                //tempQClass[f].minions = []
                //tempQClass[f].actions = []
            
                for minionLoop in 0...permClassList[f].minions.count - 1 {
                
                    //this is a minion..ck minion ability for pickerchoice(keyword)
                    if permClassList[f].minions[minionLoop].Ability[0].abilityLabel.range(of: pickerchoice) != nil {
                        print("This is a what were looking for \(pickerchoice)")
                        print("We found one that says, ' \(permClassList[f].minions[minionLoop].Ability[0].abilityLabel)'")
                        
                        tempQClass.append(permClassList[f])
                        
                        tempQClass.last?.minions = []
                        tempQClass.last?.actions = []
                        
                        tempQClass.last?.minions.append(permClassList[f].minions[minionLoop])
                    }
                    
                }
                
                for actionLoop in 0...permClassList[f].actions.count - 1 {
                    
                    //this is a action..ck minion ability for pickerchoice(keyword)
                    if permClassList[f].actions[actionLoop].Ability[0].actionCardAbilityName.range(of: pickerchoice) != nil {
                        print("This is a what were looking for \(pickerchoice)")
                        print("We found one that says, ' \(permClassList[f].actions[actionLoop].Ability[0].actionCardAbilityName)'")
                        
                        tempQClass.append(permClassList[f])
                        
                        tempQClass.last?.minions = []
                        tempQClass.last?.actions = []
                        
                        tempQClass.last?.actions.append(permClassList[f].actions[actionLoop])
                        
                    }

                    //print("This is a action")
                }
            
        } //end of for f loop
        
        
        
        tempClass = tempQClass
    }
    
    /*
 
     //struct info we need to fill
     var factionName: String
     var cardName: String
     //this will be Minion or Action
     var cardType: String
     var powerLevel: Int
     var cardAbility: String
     
     //"All", "Ongoing", "Talent", "Special", "Top Minion", "Top Action", "Kill A Minion", "Move A Minion", "Extra Minion", "Extra Action", "Control A Minion", "Play From Discard Pile", "Gain VP"
     //each card can have multiple keywords
     var keywords: [String] = [""]
 
 */
    
    
    
    
    
    

}
