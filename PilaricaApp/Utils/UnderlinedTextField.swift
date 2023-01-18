//
//  TextField.swift
//  PilaricaApp
//
//  Created by Daniel Diaz on 17/01/23.
//

import Foundation
import UIKit

class UnderlinedTextField: UITextField {
    
    private let underline = CALayer()

    private func setupUnderLine() {
        
        borderStyle = .none
        
        let lineWidth: CGFloat = 1.0
        underline.borderColor = UIColor.darkGray.cgColor
        underline.frame = CGRect (
            x: 0,
            y: frame.size.height - lineWidth,
            width: frame.size.width,
            height: frame.size.height
        )
        underline.borderWidth = lineWidth
        
        layer.addSublayer(underline)
        layer.masksToBounds = true
    }
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        setupUnderLine()
    }
}
