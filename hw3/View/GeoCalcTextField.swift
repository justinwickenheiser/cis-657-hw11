//
//  GeoCalcTextField.swift
//  hw3
//
//  Created by Justin Wickenheiser on 5/22/18.
//  Copyright © 2018 Justin Wickenheiser. All rights reserved.
//

import UIKit

class GeoCalcTextField: DecimalMinusTextField {
    override func awakeFromNib() {
        
        self.tintColor = FOREGROUND_COLOR
        self.layer.borderWidth = 1.0
        self.layer.borderColor = FOREGROUND_COLOR.cgColor
        self.layer.cornerRadius = 5.0
        
        self.textColor = FOREGROUND_COLOR
        self.backgroundColor = UIColor.clear
        self.borderStyle = .roundedRect
        
        guard let ph = self.placeholder  else {
            return
        }
        
        self.attributedPlaceholder =
            NSAttributedString(string: ph, attributes: [NSAttributedStringKey.foregroundColor :
                FOREGROUND_COLOR])
    }

}
