//
//  BullMatingViewController.swift
//  BSE
//
//  Created by Chris Piggott on 11/18/15.
//  Copyright © 2015 Null Development. All rights reserved.
//

import UIKit

import Parse

class BullMatingViewController: UIViewController {

    var bull : PFObject!;
    
    
    
    @IBOutlet var seasonUsedField: UITextField!
    @IBOutlet var lastSeasonField: UITextField!
    @IBOutlet var descriptionField: UITextField!
    @IBOutlet var otherComments: UITextField!
    @IBOutlet var singleMuti: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Mating Info";
        
        seasonUsedField.text = bull["seasonsUsed"] as? String;
        lastSeasonField.text = bull["lastSeasonPerformance"] as? String;
        descriptionField.text = bull["matingDescription"] as? String;
        otherComments.text = bull["matingComments"] as? String;
        
        if(bull["singleOrMultiSire"] != nil){
            
            let singleMultiString = bull["singleOrMultiSire"] as! String;
            
            if(singleMultiString == "Single-Sire"){
                singleMuti.selectedSegmentIndex = 0;
            }
            else if (singleMultiString == "Multi-Sire"){
                singleMuti.selectedSegmentIndex = 1;
            }
            
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func viewWillDisappear(animated: Bool) {
        
        if(seasonUsedField.text != nil){
            bull["seasonsUsed"] = seasonUsedField.text;
        }
        
        if(lastSeasonField.text != nil){
            bull["lastSeasonPerformance"] = lastSeasonField.text;
        }
        
        if(descriptionField.text != nil){
            bull["matingDescription"] = descriptionField.text;
        }
        
        if(otherComments.text != nil){
            bull["matingComments"] = otherComments.text;
        }
        
        
        
        //Set all variables
        
        bull.pinInBackground();
    }
    
    @IBAction func singleMultiIndexCHanged(sender: UISegmentedControl) {
        switch singleMuti.selectedSegmentIndex
        {
        case 0:
            bull["singleOrMultiSire"] = "Single-Sire";
        case 1:
            bull["singleOrMultiSire"] = "Multi-Sire";
        default:
            break;
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
