//
//  GameSelectionViewController.swift
//  NSFWords
//
//  Created by Jeff Fermon on 7/26/17.
//  Copyright © 2017 Jeff Fermon. All rights reserved.
//

import UIKit

class GameSelectionViewController: UIViewController {

    var gameManager : GameManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        if let button = sender as? UIButton {
            switch button.tag {
            case 0:
                gameManager?.clueType = .explain
                break
            case 1:
                gameManager?.clueType = .charades
                break
            default:
                gameManager?.clueType = .explain
                break
            }

        }
        
        if let destinationVC = segue.destination as? GamePlayViewController
        {
            
            destinationVC.shouldResetGame = true
            destinationVC.gameManager = self.gameManager;
        }
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
