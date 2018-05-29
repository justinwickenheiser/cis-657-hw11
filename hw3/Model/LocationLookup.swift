//
//  LocationLookup.swift
//  hw3
//
//  Created by Justin Wickenheiser on 5/29/18.
//  Copyright © 2018 Justin Wickenheiser. All rights reserved.
//

import Foundation

struct LocationLookup {
    var origLat: Double
    var origLng: Double
    var destLat: Double
    var destLng: Double
    var timestamp: Date
    
    init (origLat:Double, origLng:Double, destLat:Double, destLng: Double, timestamp: Date){
        self.origLat = origLat
        self.origLng = origLng
        self.destLat = destLat
        self.destLng = destLng
        self.timestamp = timestamp
    }
}
