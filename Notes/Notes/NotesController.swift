//
//  NotesController.swift
//  Notes
//
//  Created by Patrick Pahl on 5/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class NotesController {
    
    private let kNotes = "notes"
    
    static let sharedInstance = NotesController()

    var notes: [Note] = []

    init(){
        loadFromPersistentStorage()
    }
    
    func createNote(note: Note){
        notes.append(note)
        saveToPersistentStorage()
    }
    
    func deleteNote(note: Note){
        guard let index = notes.indexOf(note) else {return}
        notes.removeAtIndex(index)
        saveToPersistentStorage()
    }

func saveToPersistentStorage(){
    NSUserDefaults.standardUserDefaults().setObject(notes.map{$0.dictionaryCopy}, forKey: kNotes)
}

    func loadFromPersistentStorage(){
        guard let notesDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(kNotes) as? [[String: AnyObject]] else {return}
        self.notes = notesDictionaryArray.flatMap{Note(dictionary: $0)
}
}
}