//
//  Date+ISO8601.swift
//  hw3
//
//  Created by Nathan on 6/5/18.
//  Copyright © 2018 Justin Wickenheiser. All rights reserved.
//

import Foundation

extension Date {
	struct MyFormatter {
		static let iso8601: DateFormatter = {
			let formatter = DateFormatter()
			formatter.calendar = Calendar(identifier: .iso8601)
			formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSxxx"
			return formatter
		}()
		static let short: DateFormatter = {
			let formatter = DateFormatter()
			formatter.dateFormat = "yyyy-MM-dd"
			return formatter
		}()
	}
	var myShort: String {
		return MyFormatter.short.string(from: self)
	}
	var iso8601: String {
		return MyFormatter.iso8601.string(from: self)
	}
}
extension String {
	var dateFromISO8601: Date? {
		return Date.MyFormatter.iso8601.date(from: self)
	}
}
