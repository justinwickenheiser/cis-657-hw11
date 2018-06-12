//
//  Weather.swift
//  hw3
//
//  Created by Nathan on 6/12/18.
//  Copyright © 2018 Justin Wickenheiser. All rights reserved.
//

import Foundation

struct Weather {
	var iconName : String
	var temperature : Double
	var summary : String
	init(iconName: String, temperature: Double, summary: String) {
		self.iconName = iconName
		self.temperature = temperature
		self.summary = summary
	}
}
protocol WeatherService {
	func getWeatherForDate(date: Date, forLocation location: (Double, Double),
						   completion: @escaping (Weather?) -> Void)
}
