//
//  MainVC.swift
//  Appsflyer_SDK_Validator
//
//  Created by Julio Rodriquez on 7/24/18.
//  Copyright © 2018 Julio Sanchez. All rights reserved.
//

import UIKit
import AppsFlyerLib

class MainVC: UIViewController, AppsFlyerTrackerDelegate {
    
    var logoImage: UIView = {
        var container = UIView()

        var logo = UIImageView(image: #imageLiteral(resourceName: "AppsFlyer_Logo"))
        logo.contentMode = .scaleAspectFit
        container.addSubview(logo)
        
        logo.anchor(topAnchor: nil, topPadding: 0, bottomAnchor: nil, bottomPadding: 0, leftAnchor: nil, leftPadding: 0, rightAnchor: nil, rightPadding: 0, height: 150, width: 250)
        logo.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        logo.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        
        return container
    }()
    
    var devTextLabel: UILabel = {
        let textlabel = UILabel()
        textlabel.text = "DevKey:"
        
        return textlabel
    }()
    
    var devTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Dev Key"
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    var appIdTextLabel: UILabel = {
        let textlabel = UILabel()
        textlabel.text = "AppID:"
        
        return textlabel
    }()
    
    var appIdTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter App id"
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    var initButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Enter", for: .normal)
        button.backgroundColor = UIColor(red: 17/225, green: 154/255, blue: 237/255, alpha: 1)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(enterButton), for: .touchUpInside)
        return button
    }()
    
    var inappEventLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Test In-App Event:"
        
        return label
    }()
    
    var inappEventButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Enter", for: .normal)
        button.backgroundColor = UIColor(red: 17/225, green: 154/255, blue: 237/255, alpha: 1)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(inappEvent), for: .touchUpInside)
        
        return button
    }()
    
    var inappEventNameField: UITextField = {
        
        let text = UITextField();
        text.placeholder = "Event Name"
        text.borderStyle = .roundedRect
        
        return text
    }()
    
    var inappEventParamField: UITextField = {
        
        let text = UITextField();
        text.placeholder = "Event Param"
        text.borderStyle = .roundedRect
        
        return text
    }()
    
    var inappEventValueField: UITextField = {
        
        let text = UITextField();
        text.placeholder = "Event Value"
        text.borderStyle = .roundedRect
        
        return text
    }()
    
    var trackingUrlLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Tracking-URL:"
        
        return label
    }()
    
    var trackingUrlField: UITextField = {
        
        let field = UITextField();
        field.placeholder = "Enter URL"
        field.borderStyle = .roundedRect
        
        return field
    }()
    
    var trackingUrlButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Enter", for: .normal)
        button.backgroundColor = UIColor(red: 17/225, green: 154/255, blue: 237/255, alpha: 1)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(trackingUrl), for: .touchUpInside)
        
        return button
    }()
    
    var gcdLabel: UILabel = {
        
        let label = UILabel()
        label.text = "GCD:"
        
        return label
    }()
    
    var gcdDeviceField: UITextField = {
        
        let field = UITextField()
        field.placeholder = "Enter Appsflyer Id"
        field.borderStyle = .roundedRect
        
        return field
    }()
    
    var gcdButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Enter", for: .normal)
        button.backgroundColor = UIColor(red: 17/225, green: 154/255, blue: 237/255, alpha: 1)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(getUserConverisonData), for: .touchUpInside)
        
        return button
    }()
    
    var consoleTextField: UITextView = {
        let field = UITextView()
        field.backgroundColor = UIColor.white
        field.tintColor = UIColor.lightGray
        field.allowsEditingTextAttributes = false
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.borderWidth = 2
        field.layer.cornerRadius = 5
        
        return field
    }()
    
    var consoleLabel: UILabel = {
        let label = UILabel()
        label.text = "Console Log Info:"
        
        return label
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        
        AppsFlyerTracker.shared()?.appsFlyerDevKey = devTextField.text
        AppsFlyerTracker.shared()?.appleAppID = appIdTextField.text
        AppsFlyerTracker.shared()?.delegate = self
        
        //Setting debugger
        AppsFlyerTracker.shared()?.isDebug = true
        
        //Setting all sub views and anchoring all properites, see MainVC+propertiesAnchor
        setAnchorsAndViews()
        
        //Disable the keyboard...
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        
    }
    
    @objc func inappEvent(){
        
        guard let inappName = inappEventNameField.text else { return }
        guard let inappParam = inappEventParamField.text else { return }
        guard let inappValue = inappEventValueField.text else { return }
        
        AppsFlyerTracker.shared()?.trackEvent(inappName, withValues: [
            inappParam: inappValue
            ])
        addToConsoleLogger(text: "EVENT LOG: In-App Event Sent: \(inappName):\(inappValue)\n")
    }
    
    @objc func enterButton(){

        
        //Checking that a dev key was set before init Appsflyer SDK.
        if let text = devTextField.text {
            if text != "" {
                AppsFlyerTracker.shared()?.trackAppLaunch()
                printUserData()
                addToConsoleLogger(text: "EVENT LOG: SDK INIT: trackAppLaunch() called.")
            } else {
                addToConsoleLogger(text: "USER: Please enter Dev Key")
            }
        }
    }
    
    @objc func trackingUrl(){
        
        guard let tempUrl = trackingUrlField.text else {
            addToConsoleLogger(text: "USER: Please Add Tracking URL")
    
            return
        }
        
        if let url = URL(string: tempUrl) {
            
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request)
            addToConsoleLogger(text: "EVENT LOG: Tracking url request made: \(request) \n")
            
            task.resume()
        }
    }
    
    func printUserData() {
        
        guard let sdkV = AppsFlyerTracker.shared()?.getSDKVersion() else { return }
        guard let appsflyerid = AppsFlyerTracker.shared()?.getAppsFlyerUID() else { return }
        guard let idfa = AppsFlyerTracker.shared()?.advertiserId else { return }

        addToConsoleLogger(text: "EVENT LOG: Appsflyer SDK \(sdkV) \n")
        addToConsoleLogger(text: "EVENT LOG: Appsflyer id:\(appsflyerid) \n")
        addToConsoleLogger(text: "EVENT LOG: Advertising id:\(idfa) \n"
)

    }
}
