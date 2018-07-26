//
//  MainVC+AppsflyerTrackerGCD.swift
//  Appsflyer_SDK_Validator
//
//  Created by Julio Rodriquez on 7/25/18.
//  Copyright © 2018 Julio Sanchez. All rights reserved.
//

import UIKit
import AppsFlyerLib

extension MainVC {
    
    //https://sdk.appsflyer.com/install_data/v3/id122222222?devkey=UBZy5orcdbz3RYpbK6z7AW&device_id=1532440900066-8339880
    
    @objc func getUserConverisonData(){
        
        guard let appid = appIdTextField.text else {
            addToConsoleLogger(text: "EVENT LOG: Failed to parse app id \n")
            return }
        guard let devkey = devTextField.text else {
            addToConsoleLogger(text: "EVENT LOG: Failed to parse dev key \n")
            return }
        
        guard var fieldDeviceId = gcdDeviceField.text else {
            return
        }
        
        if fieldDeviceId == "" {
            fieldDeviceId = (AppsFlyerTracker.shared()?.getAppsFlyerUID())!
        }
        
        let tempurl = "https://sdk.appsflyer.com/install_data/v3/\(appid)?devkey=\(devkey)&device_id=\(fieldDeviceId)"
        
        if let url = URL(string: tempurl) {
            
            //printing to text view
            addToConsoleLogger(text: "EVENT LOG: GCD API CALL: \(url) \n")
            
            URLSession.shared.dataTask(with: url) { (data, resp, error) in
                
                if let err = error {
                    DispatchQueue.main.async {
                        self.addToConsoleLogger(text: "EVENT LOG: GCD API error: \(err) \n")
                    }
                    
                } else {
                    guard let responseData = data else { return }
                    let dataAsString = String(data: responseData, encoding: .utf8)
                    DispatchQueue.main.async {
                        self.addToConsoleLogger(text: "EVENT LOG: GCD API response: \(dataAsString ?? "Failed to encode") \n")
                    }
                }
            }.resume()
        }
        
    }
    
    
    
    
    
}
