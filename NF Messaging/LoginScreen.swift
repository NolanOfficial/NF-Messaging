//
//  LoginScreen.swift
//  NF Messaging
//
//  Created by Nolan Fuchs on 12/3/18.
//  Copyright © 2018 Nolan Fuchs. All rights reserved.
//

import UIKit
import Firebase
import SkyFloatingLabelTextField

class LoginScreen: UIViewController, UITextFieldDelegate {

    // Labels and Views
    
    @IBOutlet weak var usernameText: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var passwordText: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: program begins
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameText.text = nil
        passwordText.text = nil
        activityIndicator.isHidden = true
       
        disableButton()
        
        // Check to see if user has previously been signed in
        
        Auth.auth().addStateDidChangeListener {
            auth, user in
            if user != nil {
                self.performSegue(withIdentifier: "goToHomeScreen", sender: nil)
            } else {
                return
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameText?.delegate = self
        passwordText?.delegate = self
        
        
        
        
    }
    
    // Actions/Functions
    
    @IBAction func signInAction(_ sender: Any) {
        print("Attempting To Log In...")
        passwordText.resignFirstResponder()
        usernameText.resignFirstResponder()
        signInButton.setTitle(" ", for: .normal)
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        
        
        // Authenticating Login
        
        Auth.auth().signIn(withEmail: self.usernameText.text!, password: self.passwordText.text!) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "goToHomeScreen", sender: self)
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.signInButton.setTitle("Sign In", for: .normal)
                print("Successfully Logged In!")
                print(Auth.auth().currentUser!.displayName!)
            } else {
                Alert.showBasicAlert(on: self, title: "Error", message: "Username or Password is incorrect")
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                print(error!.localizedDescription)
                self.signInButton.setTitle("Sign In", for: .normal)
                
            }
        }
    }
    
    // Dismisses Keyboard on outside touch
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // First Responder Check
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.usernameText {
            passwordText.becomeFirstResponder()
        } else {
            signInAction(self)
        }
        return true
    }
    

    // Checking if all fields are filled out to enable button
    
    @IBAction func usernameCheck(_ sender: Any) {
        if (!usernameText.text!.isEmpty) && (!passwordText.text!.isEmpty) {
            enableButton()
        } else {
            disableButton()
        }
    }
    @IBAction func passwordCheck(_ sender: Any) {
        if (!usernameText.text!.isEmpty) && (!passwordText.text!.isEmpty) {
            enableButton()
        } else {
            disableButton()
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (!usernameText.text!.isEmpty) && (!passwordText.text!.isEmpty) {
            enableButton()
        } else {
            disableButton()
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (!usernameText.text!.isEmpty) && (!passwordText.text!.isEmpty) {
            enableButton()
        } else {
            disableButton()
        }
    }

   // Enable/Disable Login Button
    
    func disableButton() {
        signInButton?.alpha = 0.5
        signInButton?.isUserInteractionEnabled = false
    }
    func enableButton() {
        signInButton?.alpha = 1.0
        signInButton?.isUserInteractionEnabled = true
    }
    
}
