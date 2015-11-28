//
//  PhysicalExamTableViewController.swift
//  BSE
//
//  Created by Chris Piggott on 11/27/15.
//  Copyright © 2015 Null Development. All rights reserved.
//

import UIKit

import Parse

class PhysicalExamTableViewController: UITableViewController {
    
    var bull : PFObject!;
    
    @IBOutlet var eyeDescription: UITextField!
    @IBOutlet var feetDescription: UITextField!
    @IBOutlet var legsDescription: UITextField!
    @IBOutlet var testiclesDescription: UITextField!
    @IBOutlet var accesoryDescription: UITextField!
    @IBOutlet var inguinalDescription: UITextField!
    @IBOutlet var scrotalDescription: UITextField!
    @IBOutlet var epidydimidesDescription: UITextField!
    @IBOutlet var penisDescription: UITextField!
    @IBOutlet var prepuceDescription: UITextField!
    @IBOutlet var scrotumDescription: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        eyeDescription.text = bull["eyeDescription"] as? String;
        feetDescription.text = bull["feetDescription"] as? String;
        legsDescription.text = bull["legsDescription"] as? String;
        testiclesDescription.text =  bull["testiclesDescription"] as? String;
        accesoryDescription.text = bull["accesoryDescription"] as? String;
        inguinalDescription.text = bull["inguinalDescription"] as? String;
        scrotalDescription.text = bull["scrotalDescription"] as? String;
        epidydimidesDescription.text = bull["epidydimidesDescription"] as? String;
        penisDescription.text = bull["penisDescription"] as? String;
        prepuceDescription.text = bull["prepuceDescription"] as? String;
        scrotumDescription.text = bull["scrotumDescription"] as? String;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        if(eyeDescription.text != nil){
            bull["eyeDescription"] = eyeDescription.text;
            bull["eyesNormal"] = false;
        } else {
            bull["eyesNormal"] = true;
        }
        
        if(feetDescription.text != nil){
            bull["feetDescription"] = feetDescription.text;
            bull["feetNormal"] = false;
        } else {
            bull["feetNormal"] = true;
        }
        
        if(legsDescription.text != nil){
            bull["legsDescription"] = legsDescription.text;
            bull["legsNormal"] = false;
        } else {
            bull["legsNormal"] = true;
        }
        
        if(testiclesDescription.text != nil){
            bull["testiclesDescription"] = testiclesDescription.text;
            bull["testiclesNormal"] = false;
        } else {
            bull["testiclesNormal"] = true;
        }
        
        if(accesoryDescription.text != nil){
            bull["accesoryDescription"] = accesoryDescription.text;
            bull["accesoryNormal"] = false;
        } else {
            bull["accesoryNormal"] = true;
        }
        
        if(inguinalDescription.text != nil){
            bull["inguinalDescription"] = inguinalDescription.text;
            bull["inguinalNormal"] = false;
        } else {
            bull["inguinalsNormal"] = true;
        }
        
        if(scrotalDescription.text != nil){
            bull["scrotalDescription"] = scrotalDescription.text;
            bull["scrotalNormal"] = false;
        } else {
            bull["scrotalNormal"] = true;
        }
        
        if(epidydimidesDescription.text != nil){
            bull["epidydimidesDescription"] = epidydimidesDescription.text;
            bull["epidydimidesNormal"] = false;
        } else {
            bull["epidydimidesNormal"] = true;
        }
        
        if(penisDescription.text != nil){
            bull["penisDescription"] = penisDescription.text;
            bull["penisNormal"] = false;
        } else {
            bull["penisNormal"] = true;
        }
        
        if(prepuceDescription.text != nil){
            bull["prepuceDescription"] = prepuceDescription.text;
            bull["prepuceNormal"] = false;
        } else {
            bull["prepuceNormal"] = true;
        }
        
        if(scrotumDescription.text != nil){
            bull["scrotumDescription"] = scrotumDescription.text;
            bull["scrotumNormal"] = false;
        } else {
            bull["scrotumNormal"] = true;
        }
        
        bull.pinInBackground();
        
        
        
    }

    // MARK: - Table view data source

    

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
