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
    
    
    init(title: String) {
        self.title = title
    }
    
}

func == (lhs: Entry, rhs: Entry) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}
