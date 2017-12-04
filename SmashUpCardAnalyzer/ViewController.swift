//
//  ViewController.swift
//  SmashUpCardAnalyzer
//
//  Created by Robert Martin on 6/29/17.
//  Copyright © 2017 Robert Martin. All rights reserved.
//

//issues: going from one vc to another causes constraint issues which will eventually crash the app!!
// launch screen image not showing!!

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var factionPicker: UIPickerView!
    
    let choices: [String] = Factions.sharedInstance.factionListArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        let chosen = Factions.sharedInstance.factionListArray[row]
        
        performSegue(withIdentifier: "MASegue", sender: chosen)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        // showDetail Segue
        if segue.identifier == "MASegue" {
            // Sending the image to DetailViewController
            // Before appears in the screen.
            let detailViewController = segue.destination as! CardTypeMAandTopViewController
            detailViewController.chosenfaction = sender as! String
            
        }
        
        // Go to another view controller (remove image, we want to send correct segue name and player names{and number})
        //performSegue(withIdentifier: "showDetail", sender: imageView.image)
    }




}

