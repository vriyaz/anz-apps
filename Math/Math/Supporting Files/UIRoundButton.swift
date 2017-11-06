//
//  RoundButton.swift
//  ag-tabbed-app
//
//  Created by Vali, Riyaz on 10/22/17.
//  Copyright © 2017 az-apps. All rights reserved.
//

import UIKit

@IBDesignable
class UIRoundButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateCornerRadius()
    }
    
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            updateCornerRadius()
        }
    }

    private func updateCornerRadius() {
        layer.cornerRadius = rounded ? min(frame.size.height, frame.size.width) / 2 : cornerRadius
    }
}

