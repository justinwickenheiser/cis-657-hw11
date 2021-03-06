//
//  DarkSkyWeatherService.swift
//  hw3
//
//  Created by Nathan on 6/12/18.
//  Copyright © 2018 Justin Wickenheiser. All rights reserved.
//

import Foundation

let sharedDarkSkyInstance = DarkSkyWeatherService()

class DarkSkyWeatherService: WeatherService {
	let API_BASE = "https://api.darksky.net/forecast/"
	let API_PRIV = "f6cfb314c592db99ca8f7fdae97a884e"
	var urlSession = URLSession.shared
	
	class func getInstance() -> DarkSkyWeatherService {
		return sharedDarkSkyInstance
	}
	func getWeatherForDate(date: Date, forLocation location: (Double, Double),
						   completion: @escaping (Weather?) -> Void)
	{
		// TODO: concatentate the complete endpoint URL here.
		let urlStr = API_BASE + API_PRIV + "/\(location.0),\(location.1),\(Int(date.timeIntervalSince1970))"
		let url = URL(string: urlStr)
		let task = self.urlSession.dataTask(with: url!) {
			(data, response, error) in
			if let error = error {
				print(error.localizedDescription)
			} else if let _ = response {
				let parsedObj : Dictionary<String,AnyObject>!
				do {
					parsedObj = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? Dictionary<String,AnyObject>
					guard let currently = parsedObj["currently"],
						// TODO: extract the attributes you need for a Weather instance HERE
						let iconName = currently["icon"] as? String,
						let summary = currently["summary"] as? String,
						let temperature = currently["temperature"] as? Double
					
					else {
						completion(nil)
						return
					}
					
					let weather = Weather(iconName: iconName, temperature: temperature, summary: summary)
					
					completion(weather)
				} catch {
					completion(nil)
				}
			}
		}
		task.resume()
	}
}
