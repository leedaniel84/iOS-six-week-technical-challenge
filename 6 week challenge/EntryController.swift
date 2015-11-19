//
//  EntryController.swift
//  6 week challenge
//
//  Created by Daniel Lee on 11/18/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//

import Foundation

class EntryController {
    
    private let entriesKey = "entries"
    
    static let sharedController = EntryController()
    
    var entries: [Entry] = NameListTableViewController.entry
    
    init() {
        self.entries = []
        
        self.loadFromPersistentStorage()
        
    }
    
    var randomEntries: [Entry] = []
    
    func randomArray() {
        randomEntries = entries
        
        for item in randomEntries {
            if let index = randomEntries.indexOf(item) {
                let randomIndex = Int(arc4random_uniform(UInt32(index + 2)))
                let removedName = randomEntries.removeAtIndex(index)
                randomEntries.insert(removedName, atIndex: randomIndex)
                
            }
        }
    }
    

    
    func addEntry(entry: Entry) {
        entries.append(entry)
        
        self.saveToPersistentStorage()
    }
    
    func removeEntry(entry: Entry) {
        
        if let entryIndex = entries.indexOf(entry) {
            entries.removeAtIndex(entryIndex)
            
            self.saveToPersistentStorage()
            
        }

    }
    
    func loadFromPersistentStorage() {
        
        let entryDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(entriesKey) as? [[String: AnyObject]]
        
        if let entryDictionaries = entryDictionariesFromDefaults {
            self.entries = entryDictionaries.map({Entry(dictionary: $0)!})
        }
        
    }
    
    func saveToPersistentStorage() {
        
        let entryDictionaries = self.entries.map({$0.dictionaryCopy()})
        
        NSUserDefaults.standardUserDefaults().setObject(entryDictionaries, forKey: entriesKey)
        
    }
    
    
    
}