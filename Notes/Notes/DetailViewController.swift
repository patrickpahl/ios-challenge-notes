//
//  DetailViewController.swift
//  Notes
//
//  Created by Patrick Pahl on 5/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var note: Note?
    //Used for prepare for segue.

    @IBOutlet weak var noteTitle: UITextField!
    
    @IBOutlet weak var bodyText: UITextView!
    
    
    
    @IBAction func saveButton(sender: AnyObject) {
        
        if let note2 = self.note {
        note2.title = noteTitle.text!
        note2.bodyText = bodyText.text
        } else {
            if let title = noteTitle.text, body = bodyText.text where title.characters.count > 0 && body.characters.count > 0 {
                let newNote = Note(title: title, bodyText: body)
                NotesController.sharedInstance.createNote(newNote)
            }
        }
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       if let newNote = self.note{
         updateViewWith(newNote)
     }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func updateViewWith(note: Note){
        self.noteTitle.text = note.title
        self.bodyText.text = note.bodyText
    }
    
    
}
