//
//  ExistingGroupViewController.swift
//  BSE
//
//  Created by Chris Piggott on 11/11/15.
//  Copyright © 2015 Null Development. All rights reserved.
//

import UIKit

import Parse

class ExistingGroupViewController: UIViewController {
    
    var group: PFObject!;
    
    var bulls = [PFObject]();
    var lines = [String]();
    
    var header = "animal_age,animal_ageType,animal_brand,animal_breed,animal_dateOfBirth,animal_lotNumber,animal_rfid,animal_tag,animal_tattoo,bodyPartInfo_bodyParts_0_description,bodyPartInfo_bodyParts_0_name,bodyPartInfo_bodyParts_0_normal,bodyPartInfo_bodyParts_10_description,bodyPartInfo_bodyParts_10_name,bodyPartInfo_bodyParts_10_normal,bodyPartInfo_bodyParts_1_description,bodyPartInfo_bodyParts_1_name,bodyPartInfo_bodyParts_1_normal,bodyPartInfo_bodyParts_2_description,bodyPartInfo_bodyParts_2_name,bodyPartInfo_bodyParts_2_normal,bodyPartInfo_bodyParts_3_description,bodyPartInfo_bodyParts_3_name,bodyPartInfo_bodyParts_3_normal,bodyPartInfo_bodyParts_4_description,bodyPartInfo_bodyParts_4_name,bodyPartInfo_bodyParts_4_normal,bodyPartInfo_bodyParts_5_description,bodyPartInfo_bodyParts_5_name,bodyPartInfo_bodyParts_5_normal,bodyPartInfo_bodyParts_6_description,bodyPartInfo_bodyParts_6_name,bodyPartInfo_bodyParts_6_normal,bodyPartInfo_bodyParts_7_description,bodyPartInfo_bodyParts_7_name,bodyPartInfo_bodyParts_7_normal,bodyPartInfo_bodyParts_8_description,bodyPartInfo_bodyParts_8_name,bodyPartInfo_bodyParts_8_normal,bodyPartInfo_bodyParts_9_description,bodyPartInfo_bodyParts_9_name,bodyPartInfo_bodyParts_9_normal,bodyPartInfo_comments,collectionNumber,completed,datePerformed,generalInfo_classification,generalInfo_comments,generalInfo_customMeasurements_0_otherChoice_label,generalInfo_customMeasurements_0_value,matingInfo_comments,matingInfo_performance,matingInfo_performanceDescription,matingInfo_seasonsUsed,matingInfo_sirePastureType,morphologyInfo_comments,morphologyInfo_morphologyMeasurements_0_count,morphologyInfo_morphologyMeasurements_0_morphologyChoice_label,morphologyInfo_morphologyMeasurements_1_count,morphologyInfo_morphologyMeasurements_1_morphologyChoice_label,morphologyInfo_morphologyMeasurements_2_count,morphologyInfo_morphologyMeasurements_2_morphologyChoice_label,morphologyInfo_morphologyMeasurements_3_count,morphologyInfo_morphologyMeasurements_3_morphologyChoice_label,morphologyInfo_morphologyMeasurements_4_count,morphologyInfo_morphologyMeasurements_4_morphologyChoice_label,morphologyInfo_morphologyMeasurements_5_count,morphologyInfo_morphologyMeasurements_5_morphologyChoice_label,morphologyInfo_morphologyMeasurements_6_count,morphologyInfo_morphologyMeasurements_6_morphologyChoice_label,morphologyInfo_morphologyMeasurements_7_count,morphologyInfo_morphologyMeasurements_7_morphologyChoice_label,morphologyInfo_morphologyMeasurements_8_count,morphologyInfo_morphologyMeasurements_0_morphologyChoice_label,motilityInfo_comments,motilityInfo_grossMotilityCategory,motilityInfo_individualMotility,motilityInfo_motilityPercent,physicalInfo_bodyCondition,physicalInfo_comments,physicalInfo_frameScore,physicalInfo_hipHeight,physicalInfo_hipHeightUnits,physicalInfo_pelvicXMeasure,physicalInfo_pelvicYMeasure,physicalInfo_scrotalCircumference,rancher_address_address1,rancher_address_address2,rancher_address_city,rancher_address_email,rancher_address_phone,rancher_address_state,rancher_address_zip,rancher_firstName,rancher_lastName,rancher_ranchName,uuid,veterinarian_address_address1,veterinarian_address_address2,veterinarian_address_city,veterinarian_address_email,veterinarian_address_phone,veterinarian_address_state,veterinarian_address_zip,veterinarian_clinicName,veterinarian_firstName,veterinarian_lastName";
    

    @IBOutlet var ranchName: UILabel!
    
    @IBOutlet var dateCollected: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ranchName.text = group["ranchName"] as? String;
        
        let myDateFormatter = NSDateFormatter();
        
        myDateFormatter.dateFormat = "yyyy-MM-dd HH:mm";
        
        let date = self.group["madeAt"] as! NSDate!;
        
        
        dateCollected.text = myDateFormatter.stringFromDate(date);
        

        // Do any additional setup after loading the view.generalInfo_comments,
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func exportData(sender: AnyObject) {
        
        //Export data here
        
        let query = PFQuery(className: "Bull");
        query.fromLocalDatastore();
        query.whereKey("group", equalTo: self.group);
        query.orderByAscending("bullID");
        
        query.findObjectsInBackgroundWithBlock { (bullArray: [PFObject]?, error: NSError?) -> Void in
            
            if let bullArray = bullArray as [PFObject]!
            {
                self.bulls = bullArray as [PFObject];
                self.startExport();
                
            }
            else
            {
                print("Didn't find any bulls.")
            }
            
        };

        
        
        
        
    }
    
    func startExport(){
        
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if(segue.identifier == "viewBullsFromEdit"){
            let bullTableVC = segue.destinationViewController as! BullTableViewController;
            
            bullTableVC.group = self.group;
        }
    }
    

}
