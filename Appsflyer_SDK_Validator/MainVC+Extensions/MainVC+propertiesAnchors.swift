//
//  MainVC+propertiesAnchors.swift
//  Appsflyer_SDK_Validator
//
//  Created by Julio Rodriquez on 7/25/18.
//  Copyright © 2018 Julio Sanchez. All rights reserved.
//

import UIKit


extension MainVC {
    
    func setAnchorsAndViews(){
        
        let stackview = UIStackView(arrangedSubviews: [devTextField,appIdTextField])
        
        stackview.axis = .vertical
        stackview.spacing = 10
        stackview.distribution = .fillEqually
        
        self.view.addSubview(logoImage)
        self.view.addSubview(devTextLabel)
        self.view.addSubview(appIdTextLabel)
        self.view.addSubview(stackview)
        self.view.addSubview(initButton)
        
        
        logoImage.anchor(topAnchor: view.topAnchor, topPadding: 0, bottomAnchor: nil, bottomPadding: 0, leftAnchor: view.leftAnchor, leftPadding: 0, rightAnchor: view.rightAnchor, rightPadding: 0, height: 100, width: 0)
        devTextLabel.anchor(topAnchor: view.topAnchor, topPadding: 110, bottomAnchor: nil, bottomPadding: 0, leftAnchor: view.leftAnchor, leftPadding: 10, rightAnchor: nil, rightPadding: 0, height: 25, width: 75)
        appIdTextLabel.anchor(topAnchor: devTextLabel.bottomAnchor, topPadding: 10, bottomAnchor: nil, bottomPadding: 0, leftAnchor: view.leftAnchor, leftPadding: 10, rightAnchor: nil, rightPadding: 0, height: 25, width: 75)
        stackview.anchor(topAnchor: view.topAnchor, topPadding: 110, bottomAnchor: nil, bottomPadding: 0, leftAnchor: view.leftAnchor, leftPadding: 95, rightAnchor: nil, rightPadding: 0, height: 75, width: 150)
        initButton.anchor(topAnchor: devTextField.bottomAnchor, topPadding: 10, bottomAnchor: nil, bottomPadding: 0, leftAnchor: stackview.rightAnchor, leftPadding: 10, rightAnchor: nil, rightPadding: 0, height: 25, width: 75)
        
        
        let inappStackView = UIStackView(arrangedSubviews: [inappEventNameField, inappEventParamField, inappEventValueField])
        
        inappStackView.axis = .horizontal
        inappStackView.spacing = 10
        inappStackView.distribution = .fillEqually
        
        self.view.addSubview(inappEventLabel)
        self.view.addSubview(inappStackView)
        self.view.addSubview(inappEventButton)
        
        inappEventLabel.anchor(topAnchor: initButton.bottomAnchor, topPadding: 20, bottomAnchor: nil, bottomPadding: 0, leftAnchor: view.leftAnchor, leftPadding: 10, rightAnchor: nil, rightPadding: 0, height: 0, width: 0)
        inappStackView.anchor(topAnchor: inappEventLabel.bottomAnchor, topPadding: 10, bottomAnchor: nil, bottomPadding: 0, leftAnchor: view.leftAnchor, leftPadding: 10, rightAnchor: view.rightAnchor, rightPadding: -10, height: 25, width: 0)
        inappEventButton.anchor(topAnchor: initButton.bottomAnchor, topPadding: 20, bottomAnchor: nil, bottomPadding: 0, leftAnchor: inappEventLabel.rightAnchor, leftPadding: 10, rightAnchor: nil, rightPadding: 0, height: 25, width: 75)

        self.view.addSubview(trackingUrlLabel)
        self.view.addSubview(trackingUrlField)
        self.view.addSubview(trackingUrlButton)
        
        trackingUrlLabel.anchor(topAnchor: inappStackView.bottomAnchor, topPadding: 10, bottomAnchor: nil, bottomPadding: 0, leftAnchor: view.leftAnchor, leftPadding: 10, rightAnchor: nil, rightPadding: 0, height: 0, width: 0)
        trackingUrlField.anchor(topAnchor: inappStackView.bottomAnchor, topPadding: 10, bottomAnchor: nil, bottomPadding: 0, leftAnchor: trackingUrlLabel.rightAnchor, leftPadding: 10, rightAnchor: nil, rightPadding: 0, height: 0, width: 200)
        trackingUrlButton.anchor(topAnchor: trackingUrlLabel.bottomAnchor, topPadding: 10, bottomAnchor: nil, bottomPadding: 0, leftAnchor: view.leftAnchor, leftPadding: 10, rightAnchor: nil, rightPadding: 0, height: 25, width: 75)
        
        self.view.addSubview(gcdLabel)
        self.view.addSubview(gcdDeviceField)
        self.view.addSubview(gcdButton)
        
        gcdLabel.anchor(topAnchor: trackingUrlButton.bottomAnchor, topPadding: 20, bottomAnchor: nil, bottomPadding: 0, leftAnchor: self.view.leftAnchor, leftPadding: 10, rightAnchor: nil, rightPadding: 0, height: 25, width: 0)
        gcdDeviceField.anchor(topAnchor: trackingUrlButton.bottomAnchor, topPadding: 20, bottomAnchor: nil, bottomPadding: 0, leftAnchor: gcdLabel.rightAnchor, leftPadding: 10, rightAnchor: nil, rightPadding: 0, height: 25, width: 175)
        gcdButton.anchor(topAnchor: trackingUrlButton.bottomAnchor, topPadding: 20, bottomAnchor: nil, bottomPadding: 0, leftAnchor: gcdDeviceField.rightAnchor, leftPadding: 10, rightAnchor: nil, rightPadding: 0, height: 25, width: 75)
        
        self.view.addSubview(consoleTextField)
        self.view.addSubview(consoleLabel)

        consoleLabel.anchor(topAnchor: gcdDeviceField.bottomAnchor, topPadding: 10, bottomAnchor: nil, bottomPadding: 0, leftAnchor: view.leftAnchor, leftPadding: 10, rightAnchor: nil, rightPadding: 0, height: 0, width: 0)
        consoleTextField.anchor(topAnchor: consoleLabel.bottomAnchor, topPadding: 5, bottomAnchor: view.bottomAnchor, bottomPadding: -10, leftAnchor: view.leftAnchor, leftPadding: 10, rightAnchor: view.rightAnchor, rightPadding: -10, height: 0, width: 0)

    }
    
}

