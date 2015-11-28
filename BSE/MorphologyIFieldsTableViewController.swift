//
//  MorphologyIFieldsTableViewController.swift
//  BSE
//
//  Created by Chris Piggott on 11/27/15.
//  Copyright © 2015 Null Development. All rights reserved.
//

import UIKit

import Parse

class MorphologyIFieldsTableViewController: UITableViewController {

    var user : PFUser!;
    
    @IBOutlet var m1: UITextField!
    @IBOutlet var m2: UITextField!
    @IBOutlet var m3: UITextField!
    @IBOutlet var m4: UITextField!
    @IBOutlet var m5: UITextField!
    @IBOutlet var m6: UITextField!
    @IBOutlet var m7: UITextField!
    @IBOutlet var m8: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        user = PFUser.currentUser();
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        if(m1.text != nil){
            user["m1"] = m1.text;
        }
        
        if(m2.text != nil){
            user["m2"] = m2.text;
        }
        
        if(m3.text != nil){
            user["m3"] = m3.text;
        }
        
        if(m4.text != nil){
            user["m4"] = m4.text;
        }
        
        if(m5.text != nil){
            user["m5"] = m5.text;
        }
        
        if(m6.text != nil){
            user["m6"] = m6.text;
        }
        
        if(m7.text != nil){
            user["m7"] = m7.text;
        }
        
        if(m1.text != nil){
            user["m8"] = m8.text;
        }
        
        user.pinInBackground();
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
