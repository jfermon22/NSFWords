//
//  WordPListParser.swift
//  NSFWords
//
//  Created by Jeff Fermon on 7/19/17.
//  Copyright © 2017 Jeff Fermon. All rights reserved.
//

import Foundation

class WordPListParser {
    
    var arrayClues = Array<ClueWord>();
    var filename : String = "NSFW_Words";
    
    convenience init()
    {
        self.init(plistName: "NSFW_Words");
    }
    
    init( plistName name : String)
    {
        self.filename = name;
        if let path = Bundle.main.path(forResource: self.filename, ofType: "plist")
        {
            //get root plist array
            if let array = NSArray(contentsOfFile: path)
            {
                //loop dictionary entries in array
                for dict in array
                {
                    let name = (dict as! NSDictionary).object(forKey: "word") as! String
                    let definition = (dict as! NSDictionary).object(forKey: "definition") as! String;
                    let type = (dict as! NSDictionary).object(forKey: "type") as! String;
                    
                    //create cluewrod and push onto array
                    arrayClues.append(ClueWord(newWord: name, newDef: definition, newType: ClueType(type:type)));
                    
                }
            }
        }
    }
    
    func printArray() {
        for clue in arrayClues {
            print(clue);
        }
    }

}
