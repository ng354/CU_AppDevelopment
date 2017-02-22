//
//  ViewController.swift
//  Ng354_P2
//
//  Created by Nikita Gupta on 9/27/14.
//  Copyright (c) 2014 Nikita Gupta. All rights reserved.
//

import UIKit

class Ng354ViewController: UIViewController {

    @IBOutlet var nameField: UITextField!
    @IBOutlet var yearField: UITextField!
    @IBOutlet var majorField: UITextField!
    @IBOutlet var gpaField: UITextField!
    @IBOutlet var textView: UITextView!
    
    
    var studentList : [Student] = []
    
    class Student: NSObject {
        var studentName: String
        var studentYear: String
        var studentMajor : String
        var gpa: String
        
        override var description: String {
            return "\(studentName) is majoring in \(studentMajor) with a \(gpa)" }
        
        init(studentName: String, studentYear: String, studentMajor: String, gpa: String) {
            self.studentName = studentName
            self.studentMajor = studentMajor
            self.studentYear = studentYear
            self.gpa = gpa
        }
    }
    
    @IBAction func addButton(sender: AnyObject){
        let student = Student(studentName: nameField.text, studentYear: yearField.text, studentMajor: majorField.text, gpa: gpaField.text)
        studentList.append(student)
        var text = ""
        
        for student in studentList {
            text += "\(student.description)\n"
            textView.text = text
        }
        
        
        nameField.resignFirstResponder()
        yearField.resignFirstResponder()
        majorField.resignFirstResponder()
        gpaField.resignFirstResponder()
    
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

