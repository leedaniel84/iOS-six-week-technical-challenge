//
//  Entry.swift
//  6 week challenge
//
//  Created by Daniel Lee on 11/18/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    var title: String
    
    private let titleKey = "title"
    
    
    init(title: String) {
        self.title = title
    }
    
    init?(dictionary: Dictionary<String, AnyObject>) {
        guard let title = dictionary[titleKey] as? String else {
            
            self.title = ""
            
            return nil
        }
        
        self.title = title
        
    }
    
    func dictionaryCopy() -> Dictionary<String, AnyObject> {
        
        let dictionary = [
            titleKey : self.title,
        ]
        
        return dictionary
    }

    
}

func == (lhs: Entry, rhs: Entry) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}
