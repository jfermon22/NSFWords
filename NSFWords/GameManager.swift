//
//  GameManager.swift
//  NSFWords
//
//  Created by Jeff Fermon on 7/23/17.
//  Copyright © 2017 Jeff Fermon. All rights reserved.
//

import Foundation

class GameManager {
    
    var plistParser : WordPListParser?
    var clueManager : ClueManager?
    var scores : [UInt16]
    var clueType : ClueType
    
    
    init(plistName plist:String)
    {
            self.plistParser = WordPListParser(plistName: plist)
            self.clueManager = ClueManager(clues: (self.plistParser?.arrayClues)!)
            self.scores = Array(repeating: 0, count: 2)
            self.clueType = .explain
    }
    
}
