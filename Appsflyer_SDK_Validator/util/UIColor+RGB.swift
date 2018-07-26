//
//  UIColor+RGB.swift
//  Appsflyer_SDK_Validator
//
//  Created by Julio Rodriquez on 7/26/18.
//  Copyright © 2018 Julio Sanchez. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat,green: CGFloat,blue: CGFloat) -> UIColor {
        
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
}
