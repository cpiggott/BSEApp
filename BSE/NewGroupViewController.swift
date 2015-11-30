//
//  NewGroupViewController.swift
//  BSE
//
//  Created by Chris Piggott on 11/9/15.
//  Copyright © 2015 Null Development. All rights reserved.
//

import UIKit

import Parse

class NewGroupViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var ranchName: UITextField!
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var address1: UITextField!
    @IBOutlet var address2: UITextField!
    @IBOutlet var city: UITextField!
    @IBOutlet var state: UITextField!
    @IBOutlet var zip: UITextField!
    @IBOutlet var phone: UITextField!
    
    
    var group: PFObject!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ranchName.delegate = self;
        firstName.delegate = self;
        
        //I need to override the back button in the next view and then do this so that they don't save stuff on accident!
        //self.navigationController?.popToViewController(self.navigationController!.viewControllers[1], animated: true);
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func saveClicked(sender: AnyObject) {
        let ranchInfo = PFObject(className:"RanchInfo")
        
        ranchInfo["ranchName"] = ranchName.text;
        ranchInfo["firstName"] = firstName.text;
        ranchInfo["lastName"] = lastName.text;
        ranchInfo["address1"] = address1.text;
        ranchInfo["address2"] = address2.text;
        ranchInfo["city"] = city.text;
        ranchInfo["state"] = state.text;
        ranchInfo["zip"] = zip.text;
        ranchInfo["phone"] = phone.text;
        ranchInfo["madeAt"] = NSDate();
        
        ranchInfo.pinInBackgroundWithBlock({(success: Bool, error: NSError?) -> Void in
            
            self.group = ranchInfo;
            self.performSegueWithIdentifier("newGroupSegue", sender: nil);
            
            
        });
        
        ranchInfo.pinInBackground();
        print("Saved Ranch Name")
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if( textField == ranchName){
            firstName.becomeFirstResponder();
        }
        
        return true;
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "newGroupSegue"){
            let bullTableVC = segue.destinationViewController as! BullTableViewController;
            
            bullTableVC.group = self.group;
        }
        
        
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        //SAve object this way
    }

}
