//
//  ViewController.swift
//  hw3
//
//  Created by Justin Wickenheiser on 5/15/18.
//  Copyright © 2018 Justin Wickenheiser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var latP1: DecimalMinusTextField!
    @IBOutlet weak var longP1: DecimalMinusTextField!
    @IBOutlet weak var latP2: DecimalMinusTextField!
    @IBOutlet weak var longP2: DecimalMinusTextField!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var bearing: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // dismiss keyboard when tapping outside of text fields
        let detectTouch = UITapGestureRecognizer(target: self, action:
            #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(detectTouch)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Simple function to dismiss keyboard
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }

    @IBAction func calculate(_ sender: Any) {
    }
    
    @IBAction func clear(_ sender: Any) {
    }
    

}

