//
//  GamePlayViewController.swift
//  NSFWords
//
//  Created by Jeff Fermon on 7/22/17.
//  Copyright © 2017 Jeff Fermon. All rights reserved.
//

import UIKit

class GamePlayViewController: UIViewController {

    var clueType : ClueType?
    var clueManager : ClueManager?
    var currentWord : ClueWord?
    
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
        } else {
            infoButton.isHidden = false;
            wordLabel.text = currentWord?.word;
        }
        
    }
    
    func getNextWord() {
        currentWord = clueManager?.getNextClue(type: clueType!)
    }
    
    func setUpForStart() {

        infoButton.isHidden = true;
        wordLabel.text = "Press Start to Begin";
        nextButton.setTitle("Start", for: .normal)
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
