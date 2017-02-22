//
//  Ng354Person.swift
//  Ng354_P5
//
//  Created by Nikita Gupta on 10/26/14.
//  Copyright (c) 2014 Nikita Gupta. All rights reserved.
//

import UIKit

class Person: NSObject {

    let fname: String
    let lname: String
    let phone: String
    let email: [String]
    let picture: UIImage
    
    override var description: String {
        return "\nName: \(fname) \(lname)\nPhone: \(phone)\nEmail: \(email)"
    }
    
    var fullName: String {
        return "\(fname) \(lname)"
    }
    
    init(fname: String, lname: String, phone: String, email: [String], picture: String) {
        self.fname = fname
        self.lname = lname
        self.phone = phone
        self.email = email
        self.picture = UIImage(data: NSData(contentsOfURL: NSURL(string: picture)!)!)!
        
    }

   
}