//
//  ViewController.swift
//  Project 1
//
//  Created by Nikita Gupta on 9/22/14.
//  Copyright (c) 2014 Nikita Gupta. All rights reserved.
//

import UIKit

class ng354ViewController: UIViewController
{
    
    @IBOutlet var secretMessageLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBAction func revealMessage(sender: AnyObject) {
        
        var usr = "username"
        var pswd = "password"
        
        if usernameField.text == usr && passwordField.text == pswd {
            
            secretMessageLabel.text = "You unlocked \n the secret message"
            secretMessageLabel.textColor = UIColor.greenColor()
            usernameField.resignFirstResponder()
            passwordField.resignFirstResponder()
        }
            
        else {
            secretMessageLabel.text = "keep trying"
            secretMessageLabel.textColor = UIColor.redColor()
            usernameField.resignFirstResponder()
            passwordField.resignFirstResponder()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

