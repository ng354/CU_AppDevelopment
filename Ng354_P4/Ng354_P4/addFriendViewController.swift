//
//  addFriendViewController.swift
//  Ng354_P4
//
//  Created by Nikita Gupta on 10/19/14.
//  Copyright (c) 2014 Nikita Gupta. All rights reserved.
//

import UIKit

class addFriendViewController: UIViewController {

    @IBAction func addFriendButton(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)

    }
    @IBOutlet var friendTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
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
