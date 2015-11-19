//
//  MeasurementsTableViewController.swift
//  BSE
//
//  Created by Chris Piggott on 11/19/15.
//  Copyright © 2015 Null Development. All rights reserved.
//

import UIKit

import Parse

class MeasurementsTableViewController: UITableViewController {
    
    
    var bull : PFObject!;
    
    @IBOutlet var scrotalCircumference: UITextField!
    @IBOutlet var bodyCondition: UITextField!
    @IBOutlet var pelvicX: UITextField!
    @IBOutlet var pelvicY: UITextField!
    @IBOutlet var frameScore: UITextField!
    @IBOutlet var hipHeight: UITextField!
    @IBOutlet var otherMeasurement: UITextField!
    @IBOutlet var otherMeasurementUnits: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        scrotalCircumference.text = bull["scrotalCircumference"] as? String;
        bodyCondition.text = bull["bodyCondition"] as? String;
        pelvicX.text = bull["pelvicXMeasurement"] as? String;
        pelvicY.text = bull["pelvicYMeasurement"] as? String;
        frameScore.text = bull["frameScore"] as? String;
        hipHeight.text = bull["hipHeight"] as? String;
        otherMeasurement.text = bull["otherMeasurementPhysical"] as? String;
        otherMeasurementUnits.text = bull["otherMeasurementUnitsPhysical"] as? String;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    
    
    override func viewWillDisappear(animated: Bool) {
        if(scrotalCircumference.text != nil){
            bull["scrotalCircumference"] = scrotalCircumference.text;
        }
        
        if(bodyCondition.text != nil) {
            bull["bodyCondition"] = bodyCondition.text;
        }
        
        if(pelvicX.text != nil){
            bull["pelvicXMeasurement"] = pelvicX.text;
        }
        
        if(pelvicY.text != nil){
            bull["pelvicYMeasurement"] = pelvicY.text;
        }
        
        if(frameScore.text != nil){
            bull["frameScore"] = frameScore.text;
        }
        
        if(hipHeight.text != nil){
            bull["hipHeight"] = hipHeight.text;
        }
        
        if(otherMeasurement.text != nil){
            bull["otherMeasurementPhysical"] = otherMeasurement.text;
        }
        
        if(otherMeasurementUnits.text != nil){
            bull["otherMeasurementUnitsPhysical"] = otherMeasurementUnits.text;
        }
        
        bull.pinInBackground();
    }

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
