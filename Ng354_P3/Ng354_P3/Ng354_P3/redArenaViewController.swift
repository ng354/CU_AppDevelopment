//
//  redArenaViewController.swift
//  Ng354_P3
//
//  Created by Nikita Gupta on 10/4/14.
//  Copyright (c) 2014 Nikita Gupta. All rights reserved.
//

import UIKit

class redArenaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let location = touches.anyObject()!.locationInView(view)
        let redView = UIView(frame: CGRectMake(0, 0, 25, 50))
        redView.center = location
        redView.backgroundColor = UIColor.redColor()
        view.addSubview(redView)
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
