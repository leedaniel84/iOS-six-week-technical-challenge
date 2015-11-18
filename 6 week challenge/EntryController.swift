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
    
    var entries: [Entry]
    
    init() {
        self.entries = []
        
        self.loadFromPersistentStorage()
        
    }
    
    func addEntry(entry: Entry) {
        entries.append(entry)
        
        self.saveToPersistentStorage()
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