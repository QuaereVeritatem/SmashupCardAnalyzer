//
//  CardTypeKillMoveExtraEtcViewController.swift
//  SmashUpCardAnalyzer
//
//  Created by Robert Martin on 7/10/17.
//  Copyright © 2017 Robert Martin. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CardTypeKillMoveExtraEtcViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var cardCollection: UICollectionView!
    
    @IBAction func killMinionBtn(_ sender: UIButton) {
    }
    
    @IBAction func moveMinionBtn(_ sender: UIButton) {
    }
    
    @IBAction func extraMinionBtn(_ sender: UIButton) {
    }
    
    @IBAction func extraAction(_ sender: UIButton) {
    }
    
    @IBAction func controlMinionBtn(_ sender: UIButton) {
    }
    
    @IBAction func discardPile(_ sender: UIButton) {
    }
    
    @IBAction func gainVP(_ sender: UIButton) {
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindToTop", sender: chosenfaction)
    }
    
    @IBAction func searchAllBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "searchAllSegue", sender: chosenfaction)
    }
    
    
    var chosenfaction: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        return Factions.sharedInstance.factionListArray.count
    }
    
    
    func collectionView(_ cardCollection: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return Factions.sharedInstance.factionListArray.count
    }
    
    func collectionView(_ cardCollection: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cardCollection.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! KillCollectionViewCell
        
        // Configure the cell
        
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
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        // showDetail Segue
        if segue.identifier == "unwindToTop" {
            // Sending the image to DetailViewController
            // Before appears in the screen.
            let detailViewController = segue.destination as! CardTypeMAandTopViewController
            detailViewController.chosenfaction = chosenfaction
            
        }
        
        // Go to another view controller (remove image, we want to send correct segue name and player names{and number})
        //performSegue(withIdentifier: "showDetail", sender: imageView.image)
    }



}
