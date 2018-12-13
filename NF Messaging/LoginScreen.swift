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
        signInButton.setTitle(" ", for: .normal)
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        errorMessage.isHidden = true
        
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
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.errorMessage.isHidden = false
                print(error!.localizedDescription)
                self.signInButton.setTitle("Sign In", for: .normal)
    
            }
        }
         

        
        
        
    }
    
    // Dismisses Keyboard on outside touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
   
    
    
}


