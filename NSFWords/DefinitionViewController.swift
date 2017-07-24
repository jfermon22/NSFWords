//
//  DefinitionViewController.swift
//  NSFWords
//
//  Created by Jeff Fermon on 7/23/17.
//  Copyright © 2017 Jeff Fermon. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {

    @IBOutlet var definitionLabel: UILabel!
    var definition :String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        definitionLabel.text = definition;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissThisView(_ sender: UITapGestureRecognizer) {
       self.dismiss(animated: true)
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
