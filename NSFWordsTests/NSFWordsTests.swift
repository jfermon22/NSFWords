//
//  NSFWordsTests.swift
//  NSFWordsTests
//
//  Created by Jeff Fermon on 7/17/17.
//  Copyright © 2017 Jeff Fermon. All rights reserved.
//

import XCTest
@testable import NSFWords

class NSFWordsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testClueWord() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let word1 = ClueWord();
        XCTAssert(word1.word == "");
        XCTAssert(word1.definition == "");
        XCTAssert(word1.type == .explain);
        
        let word2 = ClueWord(newWord: "Doggy", newDef: "Man's best friend", newType: .charades);
        XCTAssert(word2.word == "Doggy");
        XCTAssert(word2.definition == "Man's best friend");
        XCTAssert(word2.type == .charades);
        
        XCTAssert(word1 != word2);
    }
    
    func testClueManager() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var words = Array<ClueWord>();
        words.append( ClueWord(newWord: "Car", newDef: "Small transporter", newType: .explain) );
        words.append( ClueWord(newWord: "Truck", newDef: "Large transporter", newType: .explain) );
        words.append( ClueWord(newWord: "Dog", newDef: "Man's best friend", newType: .charades) );
        words.append( ClueWord(newWord: "Cat", newDef: "Man's worst friend", newType: .charades) );
        words.append( ClueWord(newWord: "Pig", newDef: "Man's dirtiest friend", newType: .charades) );
        
        let manager = ClueManager(clues: words);
        
        XCTAssertEqual(manager.arrayExplainClues.count, 2);
        XCTAssertEqual(manager.arrayCharadeClues.count, 3);
        XCTAssertEqual(manager.arrayUsedCharadeClues.count, 0);
        XCTAssertEqual(manager.arrayUsedExplainClues.count, 0);
        
        manager.insertNewClue( word: ClueWord(newWord: "Bike", newDef: "two wheeled transporter", newType: .explain) );
        manager.insertNewClue( word: ClueWord(newWord: "Bird", newDef: "Man's smallest friend", newType: .charades) );
        
        XCTAssertEqual(manager.arrayExplainClues.count, 3);
        XCTAssertEqual(manager.arrayCharadeClues.count, 4);
        XCTAssertEqual(manager.arrayUsedExplainClues.count, 0);
        XCTAssertEqual(manager.arrayUsedCharadeClues.count, 0);
        
        XCTAssertEqual(manager.getNextClue(type: .explain).type , .explain );
        
        XCTAssertEqual(manager.arrayExplainClues.count, 2);
        XCTAssertEqual(manager.arrayCharadeClues.count, 4);
        XCTAssertEqual(manager.arrayUsedExplainClues.count, 1);
        XCTAssertEqual(manager.arrayUsedCharadeClues.count, 0);
        
        XCTAssertEqual(manager.getNextClue(type: .explain).type , .explain );
        
        XCTAssertEqual(manager.arrayExplainClues.count, 1);
        XCTAssertEqual(manager.arrayCharadeClues.count, 4);
        XCTAssertEqual(manager.arrayUsedExplainClues.count, 2);
        XCTAssertEqual(manager.arrayUsedCharadeClues.count, 0);
        
        XCTAssertEqual(manager.getNextClue(type: .explain).type , .explain );
        
        XCTAssertEqual(manager.arrayExplainClues.count, 0);
        XCTAssertEqual(manager.arrayCharadeClues.count, 4);
        XCTAssertEqual(manager.arrayUsedExplainClues.count, 3);
        XCTAssertEqual(manager.arrayUsedCharadeClues.count, 0);
        
        XCTAssertEqual(manager.getNextClue(type: .explain).type , .explain );
        
        XCTAssertEqual(manager.arrayExplainClues.count, 2);
        XCTAssertEqual(manager.arrayCharadeClues.count, 4);
        XCTAssertEqual(manager.arrayUsedExplainClues.count, 1);
        XCTAssertEqual(manager.arrayUsedCharadeClues.count, 0);
        
        XCTAssertEqual(manager.getNextClue(type: .charades).type , .charades );
        
        XCTAssertEqual(manager.arrayExplainClues.count, 2);
        XCTAssertEqual(manager.arrayCharadeClues.count, 3);
        XCTAssertEqual(manager.arrayUsedExplainClues.count, 1);
        XCTAssertEqual(manager.arrayUsedCharadeClues.count, 1);
        
        XCTAssertEqual(manager.getNextClue(type: .charades).type , .charades );
        
        XCTAssertEqual(manager.arrayExplainClues.count, 2);
        XCTAssertEqual(manager.arrayCharadeClues.count, 2);
        XCTAssertEqual(manager.arrayUsedExplainClues.count, 1);
        XCTAssertEqual(manager.arrayUsedCharadeClues.count, 2);
        
        XCTAssertEqual(manager.getNextClue(type: .charades).type , .charades );
        
        XCTAssertEqual(manager.arrayExplainClues.count, 2);
        XCTAssertEqual(manager.arrayCharadeClues.count, 1);
        XCTAssertEqual(manager.arrayUsedExplainClues.count, 1);
        XCTAssertEqual(manager.arrayUsedCharadeClues.count, 3);
        
        XCTAssertEqual(manager.getNextClue(type: .charades).type , .charades );
        
        XCTAssertEqual(manager.arrayExplainClues.count, 2);
        XCTAssertEqual(manager.arrayCharadeClues.count, 0);
        XCTAssertEqual(manager.arrayUsedExplainClues.count, 1);
        XCTAssertEqual(manager.arrayUsedCharadeClues.count, 4);
        
        XCTAssertEqual(manager.getNextClue(type: .charades).type , .charades );
        
        XCTAssertEqual(manager.arrayExplainClues.count, 2);
        XCTAssertEqual(manager.arrayCharadeClues.count, 3);
        XCTAssertEqual(manager.arrayUsedExplainClues.count, 1);
        XCTAssertEqual(manager.arrayUsedCharadeClues.count, 1);
        
        
    }

    func testWordPListParser() {
        let parser = WordPListParser();
        parser.printArray();
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
