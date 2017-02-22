//
//  ViewController.swift
//  Ng354_P5
//
//  Created by Nikita Gupta on 10/26/14.
//  Copyright (c) 2014 Nikita Gupta. All rights reserved.
//

import UIKit

let JSON_URL = "https://raw.githubusercontent.com/cuappdev/trainingProgramResources/master/Lecture5JSON.json"

class Ng354ViewController: UITableViewController {
    var people: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonData: NSData = NSData(contentsOfURL: NSURL(string: JSON_URL)!)!
        
        if let jsonResult = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: nil) as? Array<AnyObject> {
        
            
            for i in jsonResult {
                var email: [String]
                if let e = i["email"] as? [String] {
                    email = e
                } else {
                    email = [i["email"] as String]
                }
                
                let person: Person = Person(
                    fname: i["fname"] as String,
                    lname: i["lname"] as String,
                    phone: i["phone"] as String,
                    email: email,
                    picture: i["picture"] as String
                )
                
                people.append(person)
            }
            
            println(people)
        }
        
        
        func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
            return true
        }
        
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as Ng354TableViewCell
        
        let currentPerson = people[indexPath.row]
        
        cell.nameLabel.text = currentPerson.fullName
        cell.phoneLabel.text = currentPerson.phone
        cell.myImage.image = currentPerson.picture
        

        
        var email: String = ""
        for e in currentPerson.email {
            email += e
            if e != currentPerson.email.last {
                email += ", "
            }
        }
        
        cell.emailLabel.text = email
        
        return cell

    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            
                people.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        }

        }
    }

