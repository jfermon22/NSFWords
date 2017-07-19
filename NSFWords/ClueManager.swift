//
//  ClueManager.swift
//  NSFWords
//
//  Created by Jeff Fermon on 7/18/17.
//  Copyright © 2017 Jeff Fermon. All rights reserved.
//

import Foundation

class ClueManager {
    var arrayExplainClues = Array<ClueWord>();
    var arrayUsedExplainClues = Array<ClueWord>();
    var arrayCharadeClues = Array<ClueWord>();
    var arrayUsedCharadeClues = Array<ClueWord>();

    
    init() {
        populateClueSets();
    }
    
    init( clues : Array<ClueWord> ) {
        for singleClue in clues {
            insertNewClue(word: singleClue);
        }
    }
    
    func populateClueSets() {
        
        //insert explain clues
        //insertNewClue(word: ClueWord(newWord: "Golden Gate Bridge", newDef: "bridge in san franciso", newType: .explain));
        
        //insert charade clues
        //insertNewClue(word: ClueWord(newWord: "dog", newDef: "Man's best friend", newType: .charades));
    
    }
    
    func insertNewClue(word: ClueWord) {
        switch word.type {
        case .explain:
            arrayExplainClues.append(word);
        case .charades:
            arrayCharadeClues.append(word);
        default:
            print("invalid clue type received");
        }
        
    }

    
    func getNextClue(type: ClueType) -> ClueWord {
        switch type {
        case .explain:
            return getNextExplainClue();
        case .charades:
            return getNextCharadeClue();
        default:
            print("invalid clue type received");
        }
        
        return ClueWord(newWord: "Error", newDef: "No clue found for type", newType: .explain);
    }
    
    
    private func getNextExplainClue() -> ClueWord {
        
        if arrayExplainClues.isEmpty {
            //clues are all used up
            self.arrayExplainClues = self.arrayUsedExplainClues;
            self.arrayUsedExplainClues.removeAll(keepingCapacity: false);
        }
        
        let clueIndex = Int(arc4random_uniform(UInt32(arrayExplainClues.count))); // [0, set size]
        
        let newClue = self.arrayExplainClues[clueIndex];
        self.arrayExplainClues.remove(at: clueIndex);
        self.arrayUsedExplainClues.append(newClue);
        
        return newClue;
    }
    
    
    
    private func getNextCharadeClue() -> ClueWord {
        
        if arrayCharadeClues.isEmpty {
            //clues are all used up
            self.arrayCharadeClues = self.arrayUsedCharadeClues;
            self.arrayUsedCharadeClues.removeAll(keepingCapacity: false);
        }
        
        let clueIndex = Int(arc4random_uniform(UInt32(arrayCharadeClues.count))); // [0, set size]
        
        let newClue = self.arrayCharadeClues[clueIndex];
        self.arrayCharadeClues.remove(at: clueIndex);
        self.arrayUsedCharadeClues.append(newClue);
        
        return newClue;
    }
    
}
