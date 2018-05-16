//
//  SettingsViewController.swift
//  hw3
//
//  Created by Nathan on 5/15/18.
//  Copyright © 2018 Justin Wickenheiser. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return pickerData.count
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return pickerData[row]
	}
	

//	var delegate: SettingsViewControllerDelegate?
	var distanceUnits: String?
	var degreeUnits: String?
	
	@IBOutlet weak var lblDistanceUnits: UILabel!
	@IBOutlet weak var lblDegreeUnits: UILabel!
	@IBOutlet weak var unitPicker: UIPickerView!
	
	var pickerData = [String]()
	
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
	@IBAction func saveSettings(_ sender: Any) {
	}
	
	@objc func hidePicker() {
		self.unitPicker.isHidden = true
	}
	
	@objc func setDistanceUnits() {
		self.unitPicker.isHidden = false
		self.pickerData = ["Kilometers", "Miles"]
		self.unitPicker.reloadAllComponents()
	}
	
	@objc func setDegreeUnits() {
		self.unitPicker.isHidden = false
		self.pickerData = ["Degrees", "Mils"]
		self.unitPicker.reloadAllComponents()
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
//
//protocol SettingsViewControllerDelegate {
//	func settingsChanged(distanceUnits: String, bearingUnits: String)
//}
