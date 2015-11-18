//
//  addEntryViewController.swift
//  6 week challenge
//
//  Created by Daniel Lee on 11/18/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//

import UIKit

class addEntryViewController: UIViewController {
    
    @IBOutlet weak var entryTextField: UITextField!
    
    var entry: Entry?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addButtonTapped(sender: AnyObject) {
        
        if let entry = self.entry {
            entry.title = self.entryTextField.text!
        } else {
            let newEntry = Entry(title: self.entryTextField.text!)
            EntryController.sharedController.addEntry(newEntry)
            self.entry = newEntry
        }
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    func updateWithEntry(entry: Entry) {
        
        self.entry = entry
        
        self.entryTextField.text = entry.title
    }


}
