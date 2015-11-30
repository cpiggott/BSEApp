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
    
    var header = "animal_age,animal_ageType,animal_brand,animal_breed,animal_dateOfBirth,animal_lotNumber,animal_rfid,animal_tag,animal_tattoo,bodyPartInfo_bodyParts_0_description,bodyPartInfo_bodyParts_0_name,bodyPartInfo_bodyParts_0_normal,bodyPartInfo_bodyParts_10_description,bodyPartInfo_bodyParts_10_name,bodyPartInfo_bodyParts_11_normal,bodyPartInfo_bodyParts_11_description,bodyPartInfo_bodyParts_11_name,bodyPartInfo_bodyParts_10_normal,bodyPartInfo_bodyParts_1_description,bodyPartInfo_bodyParts_1_name,bodyPartInfo_bodyParts_1_normal,bodyPartInfo_bodyParts_2_description,bodyPartInfo_bodyParts_2_name,bodyPartInfo_bodyParts_2_normal,bodyPartInfo_bodyParts_3_description,bodyPartInfo_bodyParts_3_name,bodyPartInfo_bodyParts_3_normal,bodyPartInfo_bodyParts_4_description,bodyPartInfo_bodyParts_4_name,bodyPartInfo_bodyParts_4_normal,bodyPartInfo_bodyParts_5_description,bodyPartInfo_bodyParts_5_name,bodyPartInfo_bodyParts_5_normal,bodyPartInfo_bodyParts_6_description,bodyPartInfo_bodyParts_6_name,bodyPartInfo_bodyParts_6_normal,bodyPartInfo_bodyParts_7_description,bodyPartInfo_bodyParts_7_name,bodyPartInfo_bodyParts_7_normal,bodyPartInfo_bodyParts_8_description,bodyPartInfo_bodyParts_8_name,bodyPartInfo_bodyParts_8_normal,bodyPartInfo_bodyParts_9_description,bodyPartInfo_bodyParts_9_name,bodyPartInfo_bodyParts_9_normal,bodyPartInfo_comments,collectionNumber,completed,datePerformed,generalInfo_classification,generalInfo_comments,generalInfo_customMeasurements_0_otherChoice_label,generalInfo_customMeasurements_0_value,matingInfo_comments,matingInfo_performance,matingInfo_performanceDescription,matingInfo_seasonsUsed,matingInfo_sirePastureType,morphologyInfo_comments,morphologyInfo_morphologyMeasurements_0_count,morphologyInfo_morphologyMeasurements_0_morphologyChoice_label,morphologyInfo_morphologyMeasurements_1_count,morphologyInfo_morphologyMeasurements_1_morphologyChoice_label,morphologyInfo_morphologyMeasurements_2_count,morphologyInfo_morphologyMeasurements_2_morphologyChoice_label,morphologyInfo_morphologyMeasurements_3_count,morphologyInfo_morphologyMeasurements_3_morphologyChoice_label,morphologyInfo_morphologyMeasurements_4_count,morphologyInfo_morphologyMeasurements_4_morphologyChoice_label,morphologyInfo_morphologyMeasurements_5_count,morphologyInfo_morphologyMeasurements_5_morphologyChoice_label,morphologyInfo_morphologyMeasurements_6_count,morphologyInfo_morphologyMeasurements_6_morphologyChoice_label,morphologyInfo_morphologyMeasurements_7_count,morphologyInfo_morphologyMeasurements_7_morphologyChoice_label,morphologyInfo_morphologyMeasurements_8_count,morphologyInfo_morphologyMeasurements_0_morphologyChoice_label,motilityInfo_comments,motilityInfo_grossMotilityCategory,motilityInfo_individualMotility,motilityInfo_motilityPercent,physicalInfo_bodyCondition,physicalInfo_comments,physicalInfo_frameScore,physicalInfo_hipHeight,physicalInfo_hipHeightUnits,physicalInfo_pelvicXMeasure,physicalInfo_pelvicYMeasure,physicalInfo_scrotalCircumference,rancher_address_address1,rancher_address_address2,rancher_address_city,rancher_address_email,rancher_address_phone,rancher_address_state,rancher_address_zip,rancher_firstName,rancher_lastName,rancher_ranchName,uuid,veterinarian_address_address1,veterinarian_address_address2,veterinarian_address_city,veterinarian_address_email,veterinarian_address_phone,veterinarian_address_state,veterinarian_address_zip,veterinarian_clinicName,veterinarian_firstName,veterinarian_lastName";
    

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
        var line = "";
        
        for bull in bulls {
            line += ",,";
            if (bull["idType"] != nil){
                if (bull["idType"] as! String == "Brand"){
                    line += "TRUE,";
                }
                else {
                    line += ",";
                }
            }
            else {
                line += ",";
            }
            
            if (bull["breed"] != nil){
                line += bull["breed"] as! String;
                line += ",";
            }
            else {
                line += ",";
            }
            
            if(bull["dobDate"] != nil){
                let dob = bull["dobDate"] as! NSDate;
                let myDateFormatter = NSDateFormatter();
                
                myDateFormatter.dateFormat = "yyyy-MM-dd HH:mm";
                line += myDateFormatter.stringFromDate(dob);
                line += ",";
            }
            else {
                line += ",";
            }
            
            if (bull["lot"] != nil){
                line += bull["lot"] as! String;
                line += ",";
            }
            else {
                line += ",";
            }
            
            if (bull["idType"] != nil){
                if (bull["idType"] as! String == "RFID"){
                    line += "TRUE,";
                }
                else {
                    line += ",";
                }
            }
            else {
                line += ",";
            }
            
            if(bull["idType"] != nil){
                if (bull["idType"] as! String == "Tag"){
                    line += "TRUE,";
                }
                else {
                    line += ",";
                }
            }
            else {
                line += ",";
            }
            
            if(bull["idType"] != nil){
                if (bull["idType"] as! String == "Tattoo"){
                    line += "TRUE,";
                }
                else {
                    line += ",";
                }
            }
            else {
                line += ",";
            }
            
            if(bull["eyeDescription"] as! String != ""){
                line += bull["eyeDescription"] as! String;
                line += ",";
                line += "Eye Description";
                line += ",";
                line += "FALSE";
                line += ",";
            }
            else{
                line += ",Eye Description,TRUE,";
            }
            
            if(bull["feetDescription"] as! String != ""){
                line += bull["feetDescription"] as! String;
                line += ",";
                line += "Feet Description";
                line += ",";
                line += "FALSE";
                line += ",";
            }
            else{
                line += ",Feet Description,TRUE,";
            }
            
            if(bull["legsDescription"] as! String != ""){
                line += bull["legsDescription"] as! String;
                line += ",";
                line += "Legs Description";
                line += ",";
                line += "FALSE";
                line += ",";
            }
            else{
                line += ",Legs Description,TRUE,";
            }
            
            if(bull["testiclesDescription"] as! String != ""){
                line += bull["testiclesDescription"] as! String;
                line += ",";
                line += "Testicle Description";
                line += ",";
                line += "FALSE";
                line += ",";
            }
            else{
                line += ",Testicle Description,TRUE,";
            }
            
            if(bull["accesoryDescription"] as! String != ""){
                line += bull["accesoryDescription"] as! String;
                line += ",";
                line += "Accessory Description";
                line += ",";
                line += "FALSE";
                line += ",";
            }
            else{
                line += ",Accesory Description,TRUE,";
            }
            
            if(bull["inguinalDescription"] as! String != ""){
                line += bull["inguinalDescription"] as! String;
                line += ",";
                line += "Inguinal Description";
                line += ",";
                line += "FALSE";
                line += ",";
            }
            else{
                line += ",Inguinal Description,TRUE,";
            }
            
            if(bull["scrotalDescription"] as! String != ""){
                line += bull["scrotalDescription"] as! String;
                line += ",";
                line += "Scrotal Description";
                line += ",";
                line += "FALSE";
                line += ",";
            }
            else{
                line += ",Scrotal Description,TRUE,";
            }
            
            if(bull["epidydimidesDescription"] as! String != ""){
                line += bull["epidydimidesDescription"] as! String;
                line += ",";
                line += "Epidydimides Description";
                line += ",";
                line += "FALSE";
                line += ",";
            }
            else{
                line += ",Epidydimides Description,TRUE,";
            }
            
            if(bull["penisDescription"] as! String != ""){
                line += bull["penisDescription"] as! String;
                line += ",";
                line += "Penis Description";
                line += ",";
                line += "FALSE";
                line += ",";
            }
            else{
                line += ",Penis Description,TRUE,";
            }
            
            if(bull["prepuceDescription"] as! String != ""){
                line += bull["prepuceDescription"] as! String;
                line += ",";
                line += "Prepuce Description";
                line += ",";
                line += "FALSE";
                line += ",";
            }
            else{
                line += ",Prepuce Description,TRUE,";
            }
            
            if(bull["scrotumDescription"] as! String != ""){
                line += bull["scrotumDescription"] as! String;
                line += ",";
                line += "Scrotum Description";
                line += ",";
                line += "FALSE";
                line += ",";
            }
            else{
                line += ",Scrotum Description,TRUE,";
            }
            
            line += ",1,,";//codyPartComments,Collection number,completed,
            
            if(bull["datePerformed"] != nil){
                let datePerormed = bull["datePerformed"] as! NSDate;
                let myDateFormatter = NSDateFormatter();
                
                myDateFormatter.dateFormat = "yyyy-MM-dd HH:mm";
                line += myDateFormatter.stringFromDate(datePerormed);
                line += ",";
            }
            else {
                line += ",";
            }
            
            if(bull["classification"] != nil){
                line += bull["classification"] as! String;
                line += ",";
            }
            else {
                line += ",";
            }
            
            if(bull["classificationText"] != nil){
                line += bull["classificationText"] as! String;
                line += ",";
            }
            else {
                line += ",";
            }
            
            line += ",,"; //generalInfo_customMeasurements_0_otherChoice_label,generalInfo_customMeasurements_0_value
            
            
            if(bull["matingComments"] != nil) {
                line += bull["matingComments"] as! String;
                line += ",";
            }
            else {
                line += ",";
            }
            
            if(bull["lastSeasonPerformance"] != nil){
                line += bull["lastSeasonPerformance"] as! String;
                line += ",";
            }
            else {
                line += ",";
            }
            
            if(bull["matingDescription"] != nil){
                line += bull["matingDescription"] as! String;
                line += ",";
            }
            else {
                line += ",";
            }
            
            if(bull["seasonsUsed"] != nil){
                line += bull["seasonsUsed"] as! String;
                line += ",,";//added for not pasture type
            }
            else {
                line += ",,";
            }
            
            if(bull["matingDescription"] != nil){
                line += bull["matingDescription"] as! String;
                line += ",";
            }
            else {
                line += ",";
            }
            
            line += ",";//Morphology comments
            
            //Morphology Value
            //Morphology Fields
            
            let query = PFQuery(className: "Collection");
            query.fromLocalDatastore();
            query.whereKey("bull", equalTo: bull);
            query.orderByDescending("createdAt1");
            var collections = [PFObject]();
            do{
                try collections = query.findObjects();
                if(collections.count > 0){
                    
                    if(collections[0]["m1"] != nil){
                        let temp = collections[0]["m1"] as! Int;
                        line += String(temp);
                        line += ",";
                        
                    }
                    else {
                        line += ",";
                    }
                    
                    if(collections[0]["title1"] != nil){
                        line += collections[0]["title1"] as! String;
                        line += ",";
                    }
                    else{
                        line += ",";
                    }
                    
                    if(collections[0]["m2"] != nil){
                        let temp = collections[0]["m2"] as! Int;
                        line += String(temp);
                        line += ",";
                        
                    }
                    else {
                        line += ",";
                    }
                    
                    if(collections[0]["title2"] != nil){
                        line += collections[0]["title2"] as! String;
                        line += ",";
                    }
                    else{
                        line += ",";
                    }
                    
                    if(collections[0]["m3"] != nil){
                        let temp = collections[0]["m3"] as! Int;
                        line += String(temp);
                        line += ",";
                        
                    }
                    else {
                        line += ",";
                    }
                    
                    if(collections[0]["title3"] != nil){
                        line += collections[0]["title3"] as! String;
                        line += ",";
                    }
                    else{
                        line += ",";
                    }
                    
                    if(collections[0]["m4"] != nil){
                        let temp = collections[0]["m4"] as! Int;
                        line += String(temp);
                        line += ",";
                        
                    }
                    else {
                        line += ",";
                    }
                    
                    if(collections[0]["title4"] != nil){
                        line += collections[0]["title4"] as! String;
                        line += ",";
                    }
                    else{
                        line += ",";
                    }
                    
                    if(collections[0]["m5"] != nil){
                        let temp = collections[0]["m5"] as! Int;
                        line += String(temp);
                        line += ",";
                        
                    }
                    else {
                        line += ",";
                    }
                    
                    if(collections[0]["title5"] != nil){
                        line += collections[0]["title5"] as! String;
                        line += ",";
                    }
                    else{
                        line += ",";
                    }
                    
                    if(collections[0]["m6"] != nil){
                        let temp = collections[0]["m6"] as! Int;
                        line += String(temp);
                        line += ",";
                        
                    }
                    else {
                        line += ",";
                    }
                    
                    if(collections[0]["title6"] != nil){
                        line += collections[0]["title6"] as! String;
                        line += ",";
                    }
                    else{
                        line += ",";
                    }
                    
                    if(collections[0]["m7"] != nil){
                        let temp = collections[0]["m7"] as! Int;
                        line += String(temp);
                        line += ",";
                        
                    }
                    else {
                        line += ",";
                    }
                    
                    if(collections[0]["title7"] != nil){
                        line += collections[0]["title7"] as! String;
                        line += ",";
                    }
                    else{
                        line += ",";
                    }
                    
                    if(collections[0]["m8"] != nil){
                        let temp = collections[0]["m8"] as! Int;
                        line += String(temp);
                        line += ",";
                        
                    }
                    else {
                        line += ",";
                    }
                    
                    if(collections[0]["title8"] != nil){
                        line += collections[0]["title8"] as! String;
                        line += ",";
                    }
                    else{
                        line += ",";
                    }
                }
                else {
                    line += ",,,,,,,,,,,,,,,,";
                }

            } catch {
                line += ",,,,,,,,,,,,,,,,";
            }
            
            line += ",";//Motility Info Comments
            
            
            if(bull["grossType"] != nil){
                line  += bull["grossType"] as! String;
            }
            else {
                line += ",";
            }
            
            if(bull["individualMotility"] != nil){
                line  += bull["individualMotility"] as! String;
            }
            else {
                line += ",";
            }
            
            if(bull["motilityPercent"] != nil){
                line  += bull["motilityPercent"] as! String;
            }
            else {
                line += ",";
            }
            
            
            
            
            
            
            
            
            
            
            
            
            
        }
        
        
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
