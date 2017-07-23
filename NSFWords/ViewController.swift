//
//  ViewController.swift
//  NSFWords
//
//  Created by Jeff Fermon on 7/17/17.
//  Copyright © 2017 Jeff Fermon. All rights reserved.
//

import UIKit

//change this to change the game version
let PLIST_NAME = "NSFW_Words"

class ViewController: UIViewController {


    let plistParser = WordPListParser(plistName: PLIST_NAME)
    var clueManager : ClueManager?;

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
       if clueManager == nil {
            clueManager = ClueManager(clues: plistParser.arrayClues);
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        // Create a variable that you want to send
        // Create a new variable to store the instance of PlayerTableViewController
        if let destinationVC = segue.destination as? GamePlayViewController
        {
            destinationVC.clueManager = self.clueManager;
            destinationVC.clueType = .explain
        }

    }
}

