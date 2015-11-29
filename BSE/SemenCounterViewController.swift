//
//  SemenCounterViewController.swift
//  BSE
//
//  Created by Chris Piggott on 11/19/15.
//  Copyright © 2015 Null Development. All rights reserved.
//

import UIKit

import Parse;

class SemenCounterViewController: UIViewController {
    
    var button1Count = 0;
    var button2Count = 0;
    var button3Count = 0;
    var button4Count = 0;
    var button5Count = 0;
    var button6Count = 0;
    var button7Count = 0;
    var button8Count = 0;
    
    var totalCount = 0;
    

    var title1 : String = "";
    var title2 : String = "";
    var title3 : String = "";
    var title4 : String = "";
    var title5 : String = "";
    var title6 : String = "";
    var title7 : String = "";
    var title8 : String = "";

    
    
    var bull : PFObject!;
    var collection : PFObject!;
    
    var user : PFUser!;
    
    var button1 : UIButton!;
    var button2 : UIButton!;
    var button3 : UIButton!;
    var button4 : UIButton!;
    var button5 : UIButton!;
    var button6 : UIButton!;
    var button7 : UIButton!;
    var button8 : UIButton!;
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Total Count:";
        
        user = PFUser.currentUser();
        
        let sizeRect = UIScreen.mainScreen().applicationFrame
        let width    = sizeRect.size.width
        let height   = sizeRect.size.height
        
        let buttonWidth = ((width - 30) / 2);
        let buttonHeight = ((height) / 6);

        if let _ = collection["m1"]{
            button1Count = collection["m1"] as! Int;
        }
        if let _ = collection["m2"]{
            button2Count = collection["m2"] as! Int;
        }
        if let _ = collection["m3"]{
            button3Count = collection["m3"] as! Int;
        }
        if let _ = collection["m4"]{
            button4Count = collection["m4"] as! Int;
        }
        if let _ = collection["m5"]{
            button5Count = collection["m5"] as! Int;
        }
        if let _ = collection["m6"]{
            button6Count = collection["m6"] as! Int;
        }
        if let _ = collection["m7"]{
            button7Count = collection["m7"] as! Int;
        }
        if let _ = collection["m8"]{
            button8Count = collection["m8"] as! Int;
        }
        
        if let _ = user["m1"]{
            title1 = user["m1"] as! String;
        }
        if let _ = user["m2"]{
            title2 = user["m2"] as! String;
        }
        if let _ = user["m2"]{
            title3 = user["m3"] as! String;
        }
        if let _ = user["m4"]{
            title4 = user["m4"] as! String;
        }
        if let _ = user["m5"]{
            title5 = user["m5"] as! String;
        }
        if let _ = user["m6"]{
            title6 = user["m6"] as! String;
        }
        if let _ = user["m7"]{
            title7 = user["m7"] as! String;
        }
        if let _ = user["m8"]{
            title8 = user["m8"] as! String;
        }
        
        
        if(title1 != ""){
            title1 = user["m1"] as! String;
            button1 = UIButton(frame: CGRectMake(10, 68, buttonWidth, buttonHeight));
            button1.backgroundColor = UIColor.blueColor();
            button1.setTitle(title1 + ": " + String(button1Count), forState: UIControlState.Normal)
            button1.addTarget(self, action: "pressed1:", forControlEvents: UIControlEvents.TouchUpInside)
            button1.tag = 21;
            self.view.addSubview(button1);
        }
        
        if(title2 != ""){
            title2 = user["m2"] as! String;
            button2 = UIButton(frame: CGRectMake((10 + (width / 2)), 68, buttonWidth, buttonHeight));
            button2.backgroundColor = UIColor.greenColor();
            button2.setTitle(title2 + ": " + String(button2Count), forState: UIControlState.Normal)
            button2.addTarget(self, action: "pressed2:", forControlEvents: UIControlEvents.TouchUpInside)
            button2.tag = 22;
            self.view.addSubview(button2);
        }

        if(title3 != ""){
            title3 = user["m3"] as! String;
            button3 = UIButton(frame: CGRectMake(10, buttonHeight + 78, buttonWidth, buttonHeight));
            button3.backgroundColor = UIColor.redColor();
            button3.setTitle(title3 + ": " + String(button3Count), forState: UIControlState.Normal)
            button3.addTarget(self, action: "pressed3:", forControlEvents: UIControlEvents.TouchUpInside)
            button3.tag = 23;
            self.view.addSubview(button3);
        }
        
        if(title4 != ""){
            button4 = UIButton(frame: CGRectMake(10 + (width / 2), buttonHeight + 78, buttonWidth, buttonHeight));
            button4.backgroundColor = UIColor.orangeColor();
            button4.setTitle(title4 + ": " + String(button4Count), forState: UIControlState.Normal)
            button4.addTarget(self, action: "pressed4:", forControlEvents: UIControlEvents.TouchUpInside)
            button4.tag = 24;
            self.view.addSubview(button4);
        }
        
        if(title5 != ""){
            button5 = UIButton(frame: CGRectMake(10, (buttonHeight * 2) + 88, buttonWidth, buttonHeight));
            button5.backgroundColor = UIColor.purpleColor();
            button5.setTitle(title5 + ": " + String(button5Count), forState: UIControlState.Normal)
            button5.addTarget(self, action: "pressed5:", forControlEvents: UIControlEvents.TouchUpInside)
            button5.tag = 25;
            self.view.addSubview(button5);
        }
        
        
        if(title6 != ""){
            button6 = UIButton(frame: CGRectMake(10 + (width / 2), (buttonHeight * 2) + 88, buttonWidth, buttonHeight));
            button6.backgroundColor = UIColor.yellowColor();
            button6.setTitle(title6 + ": " + String(button6Count), forState: UIControlState.Normal)
            button6.addTarget(self, action: "pressed6:", forControlEvents: UIControlEvents.TouchUpInside)
            button6.tag = 26;
            self.view.addSubview(button6);
        }
        
        
        if(title7 != ""){
            button7 = UIButton(frame: CGRectMake(10, (buttonHeight * 3) + 98, buttonWidth, buttonHeight));
            button7.backgroundColor = UIColor.grayColor();
            button7.setTitle(title7 + ": " + String(button7Count), forState: UIControlState.Normal)
            button7.addTarget(self, action: "pressed7:", forControlEvents: UIControlEvents.TouchUpInside)
            button7.tag = 27;
            self.view.addSubview(button7);
        }
        
        
        if(title8 != ""){
            button8 = UIButton(frame: CGRectMake(10 + (width / 2), (buttonHeight * 3) + 98, buttonWidth, buttonHeight));
            button8.backgroundColor = UIColor.orangeColor();
            button8.setTitle(title8 + ": " + String(button8Count), forState: UIControlState.Normal)
            button8.addTarget(self, action: "pressed8:", forControlEvents: UIControlEvents.TouchUpInside)
            button8.tag = 28;
            self.view.addSubview(button8);
        }
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
    
        collection["totalCount"] = totalCount;
        collection["m1"] = button1Count;
        collection["m2"] = button2Count;
        collection["m3"] = button3Count;
        collection["m4"] = button4Count;
        collection["m5"] = button5Count;
        collection["m6"] = button6Count;
        collection["m7"] = button7Count;
        collection["m8"] = button8Count;
        
        collection["title1"] = title1;
        collection["title2"] = title2;
        collection["title3"] = title3;
        collection["title4"] = title4;
        collection["title5"] = title5;
        collection["title6"] = title6;
        collection["title7"] = title7;
        collection["title8"] = title8;
        
        collection["createdAt1"] = NSDate();
        
        collection.pinInBackground();
        

        
    }
    
    
    
    
    
    func pressed1(sender: UIButton!) {
        button1Count++;
        totalCount++;
        button1.setTitle(title1 + ": " + String(button1Count), forState: UIControlState.Normal)
        self.title = "Total Count: " + String(totalCount);
    }
    
    func pressed2(sender: UIButton!) {
        button2Count++;
        totalCount++;
        button2.setTitle(title2 + ": " + String(button2Count), forState: UIControlState.Normal)
        self.title = "Total Count: " + String(totalCount);
    }
    
    func pressed3(sender: UIButton!) {
        button3Count++;
        totalCount++;
        button3.setTitle(title3 + ": " + String(button3Count), forState: UIControlState.Normal)
        self.title = "Total Count: " + String(totalCount);
    }
    
    func pressed4(sender: UIButton!) {
        button4Count++;
        totalCount++;
        button3.setTitle(title4 + ": " + String(button3Count), forState: UIControlState.Normal)
        self.title = "Total Count: " + String(totalCount);
    }
    
    func pressed5(sender: UIButton!) {
        button5Count++;
        totalCount++;
        button5.setTitle(title5 + ": " + String(button5Count), forState: UIControlState.Normal)
        self.title = "Total Count: " + String(totalCount);
    }
    
    func pressed6(sender: UIButton!) {
        button6Count++;
        totalCount++;
        button6.setTitle(title6 + ": " + String(button6Count), forState: UIControlState.Normal)
        self.title = "Total Count: " + String(totalCount);
    }
    
    func pressed7(sender: UIButton!) {
        button7Count++;
        totalCount++;
        button7.setTitle(title7 + ": " + String(button7Count), forState: UIControlState.Normal)
        self.title = "Total Count: " + String(totalCount);
    }
    
    func pressed8(sender: UIButton!) {
        button8Count++;
        totalCount++;
        button8.setTitle(title8 + ": " + String(button8Count), forState: UIControlState.Normal)
        self.title = "Total Count: " + String(totalCount);
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
