//
//  UIView+AutoLayout.swift
//  Appsflyer_SDK_Validator
//
//  Created by Julio Rodriquez on 7/24/18.
//  Copyright © 2018 Julio Sanchez. All rights reserved.
//

import UIKit

extension UIView {
    
    func anchor(topAnchor: NSLayoutYAxisAnchor?, topPadding: CGFloat, bottomAnchor: NSLayoutYAxisAnchor?, bottomPadding: CGFloat, leftAnchor: NSLayoutXAxisAnchor?, leftPadding: CGFloat, rightAnchor: NSLayoutXAxisAnchor?, rightPadding: CGFloat, height: CGFloat, width: CGFloat){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = topAnchor {
            self.topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
        }
        if let bottom = bottomAnchor {
            self.bottomAnchor.constraint(equalTo: bottom, constant: bottomPadding).isActive = true
        }
        if let left = leftAnchor {
            self.leftAnchor.constraint(equalTo: left, constant: leftPadding).isActive = true
        }
        if let right = rightAnchor {
            self.rightAnchor.constraint(equalTo: right, constant: rightPadding).isActive = true
        }

        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
    }
    
}

