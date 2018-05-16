//
//  SettingsViewController.swift
//  hw3
//
//  Created by Nathan on 5/15/18.
//  Copyright © 2018 Justin Wickenheiser. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

	var delegate: SettingsViewControllerDelegate?
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func cancelSettings(_ sender: Any) {
		self.dismiss(animated: true, completion: nil)
	}
	@IBAction func saveSettings(_ sender: Any) {
	}
	

	
	@IBOutlet weak var distanceUnits: UILabel!
	@IBOutlet weak var degreeUnits: UILabel!
	@IBOutlet weak var unitPicker: UIPickerView!
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol SettingsViewControllerDelegate {
	func settingsChanged(distanceUnits: String, bearingUnits: String)
}
