//
//  ForgotPasswordScreen.swift
//  NF Messaging
//
//  Created by Nolan Fuchs on 12/3/18.
//  Copyright © 2018 Nolan Fuchs. All rights reserved.
//

import UIKit
import Firebase
import SkyFloatingLabelTextField

class ForgotPasswordScreen: UIViewController {

    // Labels and Buttons
    @IBOutlet weak var resetEmailText: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emailSentLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activityIndicator.isHidden = true
        emailSentLabel.isHidden = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    @IBAction func resetAction(_ sender: Any) {
        resetEmailText.resignFirstResponder()
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        emailSentLabel.isHidden = true
        Auth.auth().sendPasswordReset(withEmail: resetEmailText.text!) {
            error in
            if error != nil {
                print(error?.localizedDescription ?? "Error Sending Email")
                self.activityIndicator.isHidden = true
                self.activityIndicator.stopAnimating()
                self.emailSentLabel.text = "Email Doesn't Exist"
                self.emailSentLabel.textColor = .red
                self.emailSentLabel.isHidden = false
            } else {
                print("Email Sent...")
                self.emailSentLabel.isHidden = false
                self.activityIndicator.isHidden = true
                self.activityIndicator.stopAnimating()
                self.emailSentLabel.text = "Email Sent"
                self.emailSentLabel.textColor = .green
            }
       
        }
    }
    
    @IBAction func exitAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
}
