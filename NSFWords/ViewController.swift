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


    let gameManager = GameManager(plistName: PLIST_NAME)

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
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
        if let destinationVC = segue.destination as? GameSelectionViewController
        {
            destinationVC.gameManager = self.gameManager;
        }

    }
}

