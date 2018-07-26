//
//  MainVC+TextViewLogger.swift
//  Appsflyer_SDK_Validator
//
//  Created by Julio Rodriquez on 7/26/18.
//  Copyright © 2018 Julio Sanchez. All rights reserved.
//

import UIKit

extension MainVC {
    
    func addToConsoleLogger(text: String) {
        //print to console log
        print(text)
        
        //add to textView
        consoleTextField.text.append(text)
    }
    
}
