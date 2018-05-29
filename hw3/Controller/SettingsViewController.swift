//
//  SettingsViewController.swift
//  hw3
//
//  Created by Nathan on 5/15/18.
//  Copyright © 2018 Justin Wickenheiser. All rights reserved.
//

import UIKit

// The presenting VC will implement this protocol
protocol SettingsViewControllerDelegate {
    func settingsChanged(distanceUnits: String, bearingUnits: String)
}

class SettingsViewController: UIViewController {

    var delegate: SettingsViewControllerDelegate?
    var unitToUpdate: String?
	var distanceUnits: String?
	var degreeUnits: String?
	var pickerData: [String] = [String]()
    
	@IBOutlet weak var lblDistanceUnits: UILabel!
	@IBOutlet weak var lblDegreeUnits: UILabel!
	@IBOutlet weak var unitPicker: UIPickerView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		lblDistanceUnits.text = self.distanceUnits!
		lblDegreeUnits.text = self.degreeUnits!
		
		let detectEmptyTap = UITapGestureRecognizer(target: self, action: #selector(self.hidePicker))
		self.view.addGestureRecognizer(detectEmptyTap)
		let detectDistanceTap = UITapGestureRecognizer(target: self, action: #selector(self.setDistanceUnits))
		lblDistanceUnits.addGestureRecognizer(detectDistanceTap)
		let detectDegreeTap = UITapGestureRecognizer(target: self, action: #selector(self.setDegreeUnits))
		lblDegreeUnits.addGestureRecognizer(detectDegreeTap)
		
		self.unitPicker.delegate = self
		self.unitPicker.dataSource = self
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func cancelSettings(_ sender: Any) {
       self.dismiss(animated: true, completion: nil)
	}
    // Call the delegate to pass back the data to the presenting VC
	@IBAction func saveSettings(_ sender: Any) {
        if let d = self.delegate {
            d.settingsChanged(distanceUnits: distanceUnits!, bearingUnits: degreeUnits!)
        }
        self.dismiss(animated: true, completion: nil)
	}
	
	@objc func hidePicker() {
        self.unitPicker.isHidden = true
	}
	
	@objc func setDistanceUnits() {
        self.unitToUpdate = "Distance"
        self.unitPicker.isHidden = false
		self.pickerData = ["Kilometers", "Miles"]
        // Pre-select the correct index based on the data before reloading
        let indexOfCurrentSelection = self.pickerData.index(of: self.distanceUnits!)
        self.unitPicker.selectRow(indexOfCurrentSelection!, inComponent: 0, animated: false)
        self.unitPicker.reloadAllComponents()
	}
	
	@objc func setDegreeUnits() {
        self.unitToUpdate = "Bearing"
        self.unitPicker.isHidden = false
		self.pickerData = ["Degrees", "Mils"]
        // Pre-select the correct index based on the data before reloading
        let indexOfCurrentSelection = self.pickerData.index(of: self.degreeUnits!)
        self.unitPicker.selectRow(indexOfCurrentSelection!, inComponent: 0, animated: false)
        self.unitPicker.reloadAllComponents()
	}

}

// Implement the UIPickerView datasource and delegate via extension
extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if self.unitToUpdate == "Distance" {
            self.lblDistanceUnits.text = self.pickerData[row]
            self.distanceUnits = self.pickerData[row]
        } else  {
            self.lblDegreeUnits.text = self.pickerData[row]
            self.degreeUnits = self.pickerData[row]
        }
    }
}
