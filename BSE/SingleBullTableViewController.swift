//
//  SingleBullTableViewController.swift
//  BSE
//
//  Created by Chris Piggott on 11/13/15.
//  Copyright © 2015 Null Development. All rights reserved.
//

import UIKit

import Parse

class SingleBullTableViewController: UITableViewController {
    
    var bull: PFObject!;
    var group : PFObject!;
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Bull ID: " + (bull["bullID"] as! String);
        bull["examDate"] = NSDate();
        bull.pinInBackground();
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "viewBullInfoTableView"){
            let bullInfoVC = segue.destinationViewController as! BullInfoViewController;
            
            bullInfoVC.bull = self.bull;
            bullInfoVC.group = self.group;
        }
        else if (segue.identifier == "viewSexDrive") {
            let bullSexDrive = segue.destinationViewController as! BullMatingViewController;
            
            bullSexDrive.bull = self.bull;
        }
        else if (segue.identifier == "viewPhysicalParameters")
        {
            let bullPhysical = segue.destinationViewController as! PhysicalSingleViewController;
            
            bullPhysical.bull = self.bull;
        }
        
        else if (segue.identifier == "viewClassification") {
            let bullClassification = segue.destinationViewController as! ClassificationViewController;
            
            bullClassification.bull = self.bull;
        }
        
        else if (segue.identifier == "viewSemenQuality"){
            let semenQuality = segue.destinationViewController as! MorphologyTableViewController;
            
            semenQuality.bull = self.bull;
        }
        
        else if (segue.identifier == "showMotilityFields"){
            
            let motility = segue.destinationViewController as! MotilityInfoViewController;
            
            motility.bull = self.bull;
            
        }
    }
    

}
