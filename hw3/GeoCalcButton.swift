//
//  GeoCalcButton.swift
//  hw3
//
//  Created by Justin Wickenheiser on 5/22/18.
//  Copyright © 2018 Justin Wickenheiser. All rights reserved.
//

import UIKit

class GeoCalcButton: UIButton {

    override func awakeFromNib() {
        
        self.tintColor = BACKGROUND_COLOR
        self.layer.borderWidth = 1.0
        self.layer.borderColor = FOREGROUND_COLOR.cgColor
        self.layer.cornerRadius = 5.0
        
        self.backgroundColor = FOREGROUND_COLOR
        
        
    }

}
