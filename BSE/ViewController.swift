//
//  ViewController.swift
//  BSE
//
//  Created by Chris Piggott on 11/9/15.
//  Copyright © 2015 Null Development. All rights reserved.
//

import UIKit

import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var currentUser = PFUser.currentUser();

        
        if currentUser != nil {
            if(isFirstTime())
            {
                //Show dialog to input name and email
                getEmail();
            }
            
        } else {
            PFAnonymousUtils.logInWithBlock {
                (user: PFUser?, error: NSError?) -> Void in
                if error != nil || user == nil {
                    print("Anonymous login failed.")
                } else {
                    print("Anonymous user logged in.")
                    self.getEmail()
                    //show dialog to input name and email
                }
            }
        
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Check to see if this is the users first time.
    func  isFirstTime() -> Bool {
        
        let currentUser = PFUser.currentUser();
        let firstTime = currentUser?["firstTime"] as? Bool;
        
        if(firstTime == nil || firstTime == true){
            return true;
        }
        else
        {
            return false;
        }
    }
    
    //Pops up a file dialog that asks the user for their email, then asks the user to input their name by calling getName()
    func getEmail(){
        
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Enter Email", message: "This appears to be your first time using the app. Please set you email.", preferredStyle: .Alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            textField.text = "name@example.com"
        })
        
        //3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            let textField = alert.textFields![0] as UITextField;
            print("Text field: \(textField.text)");
            PFUser.currentUser()?["firstTime"] = false;
            PFUser.currentUser()?["email"] = textField.text;
            do {
                try PFUser.currentUser()?.pin();
            } catch {
                print("Error")
            }
           
            self.getName();
            
        }))
        
        // 4. Present the alert.
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    //gets and sets the name of the user.
    func getName(){
        
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Enter Name", message: "Please set you Name.", preferredStyle: .Alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            textField.text = "John Smith"
        })
        
        //3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            let textField = alert.textFields![0] as UITextField;
            print("Text field: \(textField.text)");
            PFUser.currentUser()?["name"] = textField.text;
            do {
                try PFUser.currentUser()?.pin();
            } catch {
                print("Error")
            }
            
        }))
        
        // 4. Present the alert.
        self.presentViewController(alert, animated: true, completion: nil)
    }


    
}

