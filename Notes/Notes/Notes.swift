//
//  Notes.swift
//  Notes
//
//  Created by Patrick Pahl on 5/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation



class Note: Equatable {
    
    var title: String
    var bodyText: String
    
    private let kTitle = "title"
    private let kBodyText = "bodyText"
    
    var dictionaryCopy: [String: AnyObject]{
        return [kTitle: self.title, kBodyText: self.bodyText]
    }
    
    init(title: String, bodyText: String){
        
        self.title = title
        self.bodyText = bodyText
    }
    
    init?(dictionary: [String: AnyObject]){
        guard let title = dictionary[kTitle] as? String,
            let bodyText = dictionary[kBodyText] as? String else {return nil}
        self.title = title
        self.bodyText = bodyText
    }


}

func ==(lhs: Note, rhs: Note) -> Bool{
    return lhs.title == rhs.title && lhs.bodyText == rhs.bodyText
}








