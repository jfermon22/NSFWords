//
//  GamePlayViewController.swift
//  NSFWords
//
//  Created by Jeff Fermon on 7/22/17.
//  Copyright © 2017 Jeff Fermon. All rights reserved.
//

import UIKit

class GamePlayViewController: UIViewController {

    var gameManager : GameManager?
    var currentWord : ClueWord?
    var timer = Timer()
    
    @IBOutlet var wordLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var infoButton: UIButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateToNextWord("viewDidLoad")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateToNextWord(_ sender: Any) {
        getNextWord()
        print("nextWord is \(currentWord)")
        
        if let theSender = sender as? String
        {
            if theSender == "viewDidLoad" {
                setUpForStart()
            }
        } else  {
            let button = sender as! UIButton
            if button.titleLabel?.text == "Start" {
                 infoButton.isHidden = false;
                 nextButton.setTitle("Next", for: .normal)
                startTimer()
            }
           
            wordLabel.text = currentWord?.word;
        }
        
    }
    
    func getNextWord() {
        currentWord = gameManager?.clueManager?.getNextClue(type: (gameManager?.clueType)!)
    }
    
    func setUpForStart() {

        infoButton.isHidden = true;
        wordLabel.text = "Press Start to Begin";
        nextButton.setTitle("Start", for: .normal)
    }
    
    func startTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 3, target: self,   selector: (#selector(self.timerExpired)), userInfo: nil, repeats: false)
    }
    
    func timerExpired() {
        print("TIMER EXPIRED")
       performSegue(withIdentifier: "ScoreViewSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        // Create a variable that you want to send
        // Create a new variable to store the instance of PlayerTableViewController
        if let destinationVC = segue.destination as? ScoreViewController
        {
            destinationVC.gameManager = self.gameManager;
        }
        else if let destinationVC = segue.destination as? DefinitionViewController
        {
            destinationVC.definition = self.currentWord?.definition;
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
