//
//  LocationSearchViewController.swift
//  hw3
//
//  Created by Nathan on 6/5/18.
//  Copyright © 2018 Justin Wickenheiser. All rights reserved.
//

import UIKit
import Eureka
import GooglePlacePicker

class LocationSearchViewController: FormViewController {
	var startPoint:GMSPlace?
	var endPoint:GMSPlace?
	var selectedPoint: Int = 0
	override func viewDidLoad() {
		super.viewDidLoad()
	}
}
