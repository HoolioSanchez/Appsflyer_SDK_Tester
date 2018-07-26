//
//  AppsflyerTracker+GCD.swift
//  Appsflyer_SDK_Validator
//
//  Created by Julio Rodriquez on 7/25/18.
//  Copyright © 2018 Julio Sanchez. All rights reserved.
//

import UIKit
import AppsFlyerLib

extension MainVC {

        func onConversionDataReceived(_ installData: [AnyHashable : Any]!) {
            if let data = installData{
                print("\(data)")
                if let status = data["af_status"] as? String{
                    if(status == "Non-organic"){
                        if let sourceID = data["media_source"] , let campaign = data["campaign"] {
                            
                            DispatchQueue.main.async {
                                self.addToConsoleLogger(text: " EVENT LOG: This is a Non-Organic install. Media source: \(sourceID)  Campaign: \(campaign) onConverisonDataReceived. \n")
                            }
                        }
                    } else {
                        
                        DispatchQueue.main.async {
                            self.addToConsoleLogger(text:" EVENT LOG: This is an organic install. \n")
                        }
                    }
                }
            }
        }
        
        func onConversionDataRequestFailure(_ error: Error!) {
            if let err = error {
                DispatchQueue.main.async {
                    self.addToConsoleLogger(text:" EVENT LOG: onConversionDataRequestFailure: \(err) \n")
                }
            }
        }
        
        func onAppOpenAttribution(_ attributionData: [AnyHashable : Any]!) {
            if let data = attributionData{
                DispatchQueue.main.async {
                    self.addToConsoleLogger(text:" EVENT LOG: onAppOpenAttribution \(data) \n")
                }
            }
        }
        
        func onAppOpenAttributionFailure(_ error: Error!) {
            if let err = error{
                DispatchQueue.main.async {
                    self.addToConsoleLogger(text:" EVENT LOG: onAppOpenAttributionFailure: \(err) \n")
                }
            }
        }
    
}

