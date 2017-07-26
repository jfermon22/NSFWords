//
//  ScoreViewController.swift
//  NSFWords
//
//  Created by Jeff Fermon on 7/23/17.
//  Copyright © 2017 Jeff Fermon. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    @IBOutlet var teamNameLabel1: UILabel!
    @IBOutlet var teamNameLabel2: UILabel!
    @IBOutlet var teamScoreLabel1: UILabel!
    @IBOutlet var teamScoreLabel2: UILabel!
    var gameManager : GameManager?
    var bScoreHasBeenIncremented = false
    var lastScoreIncremented : UInt32 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        teamScoreLabel1.text = String(describing: gameManager!.scores[0])
        teamScoreLabel2.text = String(describing: gameManager!.scores[1])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        bScoreHasBeenIncremented = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func incrementScore(_ sender: UIButton) {
        if !bScoreHasBeenIncremented {
            lastScoreIncremented = UInt32(sender.tag)
            if sender.tag == 0 {
                gameManager?.scores[0] = (gameManager?.scores[0])! + 1
                teamScoreLabel1.text = String(describing: gameManager!.scores[0])
            } else {
                gameManager?.scores[1] = (gameManager?.scores[1])! + 1
                teamScoreLabel2.text = String(describing: gameManager!.scores[1])
            }
            bScoreHasBeenIncremented = true
        } else {
            let alertController = UIAlertController(title: "Error", message:
                "You have already incremented a score. Would you like to change your choice?", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
                if self.lastScoreIncremented == 0 {
                    self.gameManager?.scores[0] = (self.gameManager?.scores[0])! - 1
                    
                    self.teamScoreLabel1.text = String(describing: self.gameManager!.scores[0])
                } else {
                    self.gameManager?.scores[1] = (self.gameManager?.scores[1])! - 1
                    self.teamScoreLabel2.text = String(describing: self.gameManager!.scores[1])
                }
                self.bScoreHasBeenIncremented = false
            }))
            
            alertController.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
                print("Handle Cancel Logic here")
            }))
            
            self.present(alertController, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func ExitModal(_ sender: UIButton) {
        if !bScoreHasBeenIncremented {
            let alertController = UIAlertController(title: "Error", message:
                "Neither score has been incremented. Are you sure you would like to exit this view?", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
                self.dismiss(animated: false, completion: nil)

            }))
            
            alertController.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
                print("Handle Cancel Logic here")
            }))
            
            self.present(alertController, animated: true, completion: nil)
        }
        else
        {
           self.dismiss(animated: false, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        // Create a variable that you want to send
        // Create a new variable to store the instance of PlayerTableViewController
        if let destinationVC = segue.destination as? GamePlayViewController
        {
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
