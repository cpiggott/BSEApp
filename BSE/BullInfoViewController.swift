//
//  BullInfoViewController.swift
//  BSE
//
//  Created by Chris Piggott on 11/13/15.
//  Copyright © 2015 Null Development. All rights reserved.
//

import UIKit

import Parse

class BullInfoViewController: UIViewController {
    
    var bull : PFObject!;
    var group : PFObject!;

    
    @IBOutlet var bullIDField: UITextField!
    @IBOutlet var bullBreedField: UITextField!
    @IBOutlet var lotField: UITextField!
    @IBOutlet var dobDateLabel: UIDatePicker!
    @IBOutlet var tagTypePicker: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Bull Info";
        
        bullIDField.text = bull["bullID"] as? String;
        lotField.text = bull["lot"] as? String;
        bullBreedField.text = bull["breed"] as? String;
        
        if (bull["dobDate"] != nil){
            dobDateLabel.date = bull["dobDate"] as! NSDate;
        }
        
        if (bull["idType"] != nil) {
            let bullIdString = bull["idType"] as! String;
            
            if (bullIdString == "Tag"){
                tagTypePicker.selectedSegmentIndex = 0;
            }
            else if (bullIdString == "Tattoo") {
                tagTypePicker.selectedSegmentIndex = 1;
            }
            else if (bullIdString == "RFID") {
                tagTypePicker.selectedSegmentIndex = 2;
            }
            else if (bullIdString == "Brand"){
                tagTypePicker.selectedSegmentIndex = 3;
            }
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Called before navigating back. This will save all necessary data.
    override func viewWillDisappear(animated: Bool) {
       
        
        if(lotField.text != nil){
            bull["lot"] = lotField.text!;
        }
        
        if(bullBreedField.text != nil){
            bull["breed"] = bullBreedField.text;
        }
        
        bull.pinInBackground();
    }
    
    //When the type of ID is changed, it will get set it on the object.
    @IBAction func tagTypeChanged(sender: AnyObject) {
        switch tagTypePicker.selectedSegmentIndex
        {
        case 0:
            bull["idType"] = "Tag";
        case 1:
            bull["idType"] = "Tattoo";
        case 2:
            bull["idType"] = "RFID";
        case 3:
            bull["idType"] = "Brand";
        default:
            break;
        }
        
    }
    
    @IBAction func datePickerChanged(sender: UIDatePicker) {
        bull["dobDate"] = sender.date;
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
