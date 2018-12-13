//
//  Alert.swift
//  NF Messaging
//
//  Created by Nolan Fuchs on 12/13/18.
//  Copyright © 2018 Nolan Fuchs. All rights reserved.
//

import UIKit
import PopupDialog





struct Alert {
    
    
    
    static func showBasicAlert(on vc: UIViewController, title: String, message: String) {
        let errorImage = UIImage(named: "Error Code.jpg")
        let alert = PopupDialog(title: title, message: message, image: errorImage!)
        let cancelButton = CancelButton(title: "Cancel") {
            print("Dialog Cancelled")
        }
        
       
        alert.addButton(cancelButton)
        
        DispatchQueue.main.async {
            vc.present(alert, animated: true)
        }
            
            let pv = PopupDialogDefaultView.appearance()
            pv.titleFont    = UIFont(name: "HelveticaNeue-Light", size: 16)!
            pv.titleColor   = .white
            pv.messageFont  = UIFont(name: "HelveticaNeue", size: 14)!
            pv.messageColor = UIColor(white: 0.8, alpha: 1)
            
            // Customize the container view appearance
            let pcv = PopupDialogContainerView.appearance()
            pcv.backgroundColor = UIColor(red:0.23, green:0.23, blue:0.27, alpha:1.00)
            pcv.cornerRadius    = 2
            pcv.shadowEnabled   = true
            pcv.shadowColor     = .black
            
            // Customize overlay appearance
            let ov = PopupDialogOverlayView.appearance()
            ov.blurEnabled     = true
            ov.blurRadius      = 30
            ov.liveBlurEnabled = true
            ov.opacity         = 0.7
            ov.color           = .black
            
            // Customize default button appearance
            let db = DefaultButton.appearance()
            db.titleFont      = UIFont(name: "HelveticaNeue-Medium", size: 14)!
            db.titleColor     = .white
            db.buttonColor    = UIColor(red:0.25, green:0.25, blue:0.29, alpha:1.00)
            db.separatorColor = UIColor(red:0.20, green:0.20, blue:0.25, alpha:1.00)
            
            // Customize cancel button appearance
            let cb = CancelButton.appearance()
            cb.titleFont      = UIFont(name: "HelveticaNeue-Medium", size: 14)!
            cb.titleColor     = UIColor(white: 0.6, alpha: 1)
            cb.buttonColor    = UIColor(red:0.25, green:0.25, blue:0.29, alpha:1.00)
            cb.separatorColor = UIColor(red:0.20, green:0.20, blue:0.25, alpha:1.00)
    }
    
    
    
    
    
}
