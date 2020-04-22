//
//  Entry+Convenience.swift
//  Journal
//
//  Created by Dahna on 4/20/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

import Foundation
import CoreData

enum Mood: String, CaseIterable {
    case sad = "☹️"
    case neutral = "😐"
    case happy = "😊"
}

extension Entry {
    
    var entryRepresentation: EntryRepresentation? {
        
        guard let id = identifier,
        let title = title,
        let bodyText = bodyText,
        let timestamp = timestamp?.stringDate(),
        let mood = mood else { return nil }
        
        return EntryRepresentation(identifier: id.uuidString,
                                   title: title,
                                   bodyText: bodyText,
                                   timestamp: timestamp,
                                   mood: mood)
    }
    
    
    @discardableResult convenience init(identifier: UUID = UUID(),
                                        title: String,
                                        bodyText: String,
                                        timestamp: Date,
                                        mood: Mood = .happy,
                                        context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        self.title = title
        self.bodyText = bodyText
        self.timestamp = timestamp
        self.identifier = identifier
        self.mood = mood.rawValue
    }
}


