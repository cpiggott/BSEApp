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
    
    var bull : PFObject!;
    var collection : PFObject!;
    
    let button1:UIButton = UIButton(frame: CGRectMake(10, 68, 180, 75))


    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.backgroundColor = UIColor.greenColor()
        button1.setTitle("Button 1 Title: 0", forState: UIControlState.Normal)
        button1.addTarget(self, action: "pressed:", forControlEvents: UIControlEvents.TouchUpInside)
        button1.tag = 22;
        self.view.addSubview(button1)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    func pressed(sender: UIButton!) {
        button1Count++;
        button1.setTitle("Button 1 Title: " + String(button1Count), forState: UIControlState.Normal)
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
