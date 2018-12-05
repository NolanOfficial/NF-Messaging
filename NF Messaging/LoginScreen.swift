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

class LoginScreen: UIViewController {

    // Labels and Views
    @IBOutlet weak var usernameText: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var passwordText: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var errorMessage: UILabel!
    
    // MARK: program begins
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameText.text = nil
        passwordText.text = nil
        activityIndicator.isHidden = true
        errorMessage.isHidden = true
        
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
    }
    
    // Actions/Functions
    
    @IBAction func signInAction(_ sender: Any) {
        print("Attempting To Log In...")
        passwordText.resignFirstResponder()
        usernameText.resignFirstResponder()
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        errorMessage.isHidden = true

        // Authenticating Login
        Auth.auth().signIn(withEmail: usernameText.text!, password: passwordText.text!) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "goToHomeScreen", sender: self)
               self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                print("Successfully Logged In!")
            } else {
                self.errorMessage.isHidden = false
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                print(error!.localizedDescription)
            }
        }
        
        
        
    }
    
    // Dismisses Keyboard on outside touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    
    
    
    

}
