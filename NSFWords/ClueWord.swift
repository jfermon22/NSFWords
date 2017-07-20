//
//  ClueWord.swift
//  NSFWords
//
//  Created by Jeff Fermon on 7/18/17.
//  Copyright © 2017 Jeff Fermon. All rights reserved.
//

import Foundation

enum ClueType {
    case explain
    case charades
    
    init(num:NSNumber){
        switch num {
        case 0: self = .explain;
        case 1: self = .charades;
        default: self = .explain;
        }
    }

    init(type:String){
        switch type.lowercased() {
        case "explain": self = .explain;
        case "charades": self = .charades;
        default: self = .explain;
        }
    }
}

    
class ClueWord : Hashable, CustomStringConvertible {
    var word: String;
    var definition: String;
    var type: ClueType;
    
    init() {
        self.word = "";
        self.definition = "";
        self.type = .explain;
        
    }
    
    init( newWord: String, newDef: String, newType: ClueType ) {
        self.word = newWord;
        self.definition = newDef;
        self.type = newType;
    }
    
    var hashValue: Int {
        return (self.word + String(describing: self.type)).hashValue;
    }
    
    static func == (lhs: ClueWord, rhs: ClueWord) -> Bool {
        return  lhs.word == rhs.word && lhs.type == rhs.type;
    }
    
    var description: String {
        let string = String("\(word) {def:\(definition) type:\(type)}");
        return string!
    }
    
}


