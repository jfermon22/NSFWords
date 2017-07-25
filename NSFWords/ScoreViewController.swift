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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        teamScoreLabel1.text = String(describing: gameManager!.scores[0])
        teamScoreLabel2.text = String(describing: gameManager!.scores[1])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func incrementScore(_ sender: UIButton) {
 
        if sender.tag == 0 {
            gameManager?.scores[0] = (gameManager?.scores[0])! + 1
            teamScoreLabel1.text = String(describing: gameManager!.scores[0])
        } else {
            gameManager?.scores[1] = (gameManager?.scores[1])! + 1
            teamScoreLabel2.text = String(describing: gameManager!.scores[1])
        }
    }
    
    @IBAction func ExitModal(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
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
