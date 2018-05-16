//
//  ViewController.swift
//  hw3
//
//  Created by Justin Wickenheiser & Nathan Hull on 5/15/18.
//  Copyright © 2018 Justin Wickenheiser & Nathan Hull. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var latP1: DecimalMinusTextField!
    @IBOutlet weak var longP1: DecimalMinusTextField!
    @IBOutlet weak var latP2: DecimalMinusTextField!
    @IBOutlet weak var longP2: DecimalMinusTextField!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var bearing: UILabel!
	
	var degreeUnits: String = "Degrees"
	var distanceUnits: String = "Kilometers"
    
    
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
		let loc1 = CLLocation(latitude: CLLocationDegrees((latP1.text! as NSString).doubleValue), longitude: CLLocationDegrees((longP1.text! as NSString).doubleValue))
		let loc2 = CLLocation(latitude: CLLocationDegrees((latP2.text! as NSString).doubleValue), longitude: CLLocationDegrees((longP2.text! as NSString).doubleValue))
		
		var dist = loc1.distance(from:loc2)
		dist = dist/1000
		
		distance.text = "Distance: \(String(format:"%.2f",dist)) \(distanceUnits)"
    }
    
    @IBAction func clear(_ sender: Any) {
        latP1.text = ""
        longP1.text = ""
        latP2.text = ""
        longP2.text = ""
        distance.text = "Distance:"
        bearing.text = "Bearing:"
    }
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "SettingSegue" {
			if let destVC = segue.destination.childViewControllers[0] as? SettingsView {
				destVC.distanceUnits = self.distanceUnits
				destVC.degreeUnits = self.degreeUnits
			}
		}
	}
}

