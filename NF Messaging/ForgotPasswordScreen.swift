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

class ForgotPasswordScreen: UIViewController, UITextFieldDelegate {

    // Labels and Buttons
    @IBOutlet weak var resetEmailText: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activityIndicator.isHidden = true
        disableButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetEmailText?.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    @IBAction func resetAction(_ sender: Any) {
        resetEmailText.resignFirstResponder()
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        resetButton.setTitle(" ", for: .normal)
        
        Auth.auth().sendPasswordReset(withEmail: resetEmailText.text!) {
            error in
            if error != nil {
                print(error?.localizedDescription ?? "Error Sending Email")
                self.activityIndicator.isHidden = true
                self.activityIndicator.stopAnimating()
                self.resetButton.setTitle("Reset", for: .normal)
               Alert.showBasicAlert(on: self, title: "Error", message: "Email Does Not Exist")
                            } else {
                print("Email Sent...")
                self.activityIndicator.isHidden = true
                self.activityIndicator.stopAnimating()
                 self.resetButton.setTitle("Reset", for: .normal)
                Alert.showBasicAlert(on: self, title: "Congratulations!", message: "Email Sent")
            }
        }
    }
    
    @IBAction func exitAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // First Responder Check
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.resetEmailText {
            resetAction(self)
        }
        return true
    }
    
    // Checks to see if all fields are filled out
    
    @IBAction func emailCheck(_ sender: Any) {
        if (!(resetEmailText.text?.isEmpty)!) {
            enableButton()
        } else {
            disableButton()
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (!(resetEmailText.text?.isEmpty)!) {
            enableButton()
        } else {
            disableButton()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if (!(resetEmailText.text?.isEmpty)!) {
            enableButton()
        } else {
            disableButton()
        }
    }
    
    // Enable/Disable Reset Button
    
    func enableButton() {
        resetButton.isEnabled = true
        resetButton.alpha = 1.0
    }
    func disableButton() {
        resetButton.isEnabled = false
        resetButton.alpha = 0.5
    }
    
}
