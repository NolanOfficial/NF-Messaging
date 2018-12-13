//
//  CreatAccountScreen.swift
//  NF Messaging
//
//  Created by Nolan Fuchs on 12/3/18.
//  Copyright © 2018 Nolan Fuchs. All rights reserved.
//

import UIKit
import Firebase
import SkyFloatingLabelTextField

class CreatAccountScreen: UIViewController, UITextFieldDelegate {

    // Labels and Views
    @IBOutlet weak var createAccountUsername: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var createAccountPassword: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var createAccountPasswordRetype: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var accountMessage: UILabel!
    @IBOutlet weak var createAccountButton: UIButton!
    
    var docRef: DocumentReference? = nil
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        accountMessage.isHidden = true
        activityIndicator.isHidden = true
        createAccountUsername.text = nil
        createAccountPassword.text = nil
        createAccountPasswordRetype.text = nil
        disableButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAccountUsername?.delegate = self
        createAccountPassword?.delegate = self
        createAccountPasswordRetype?.delegate = self
        
    }
    
    @IBAction func createAccountAction(_ sender: Any) {
        print("Creating Account...")
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        accountMessage.isHidden = true
        createAccountButton.setTitle(" ", for: .normal)
        createAccountUsername.resignFirstResponder()
        createAccountPassword.resignFirstResponder()
        createAccountPasswordRetype.resignFirstResponder()
        
        if createAccountPassword.text == createAccountPasswordRetype.text {
    
            // Authenticating and creating new user
        Auth.auth().createUser(withEmail: createAccountUsername.text!, password: createAccountPassword.text!) { (user, error) in
            if user != nil {
                    let db = Firestore.firestore().collection("Users").document(self.createAccountUsername.text!)
                    self.activityIndicator.isHidden = true
                    self.activityIndicator.stopAnimating()
                    self.accountMessage.isHidden = false
                    self.createAccountButton.setTitle("Create Account", for: .normal)
                    self.accountMessage.text = "Account Created"
                    self.accountMessage.textColor = .green
                    self.accountMessage.isHidden = false
                    self.performSegue(withIdentifier: "goToHomeScreen", sender: self)
                
                // Adding Email to Database
                 db.setData([
                    "Email" : self.createAccountUsername.text!
                 ]){
                    err in
                            if let err = err {
                                print("Error adding document: \(err)")
                            } else {
                                print("Email added to database")
                            }
                }
                
                // All fields are not filled correctly
            } else {
                self.activityIndicator.isHidden = true
                self.activityIndicator.stopAnimating()
                self.createAccountButton.setTitle("Create Account", for: .normal)
                self.accountMessage.text = "Error. Please Try Again"
                self.accountMessage.textColor = .red
                self.accountMessage.isHidden = false
                print(error?.localizedDescription ?? "Fatal Error")
                }
            
            }
        
            // Passwords Do Not Match
        } else {
            print("Passwords Do Not Match")
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
            self.createAccountButton.setTitle("Create Account", for: .normal)
            self.accountMessage.text = "Passwords Do Not Match"
            self.accountMessage.textColor = .red
            self.accountMessage.isHidden = false
        }
    
    }
    
    @IBAction func exitAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
   

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Checks to see if all fields are filled out
    @IBAction func checksUsername(_ sender: Any) {
        check()
    }
    @IBAction func checkPassword(_ sender: Any) {
        check()
    }
    @IBAction func checksRetypePassword(_ sender: Any) {
        check()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        check()
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        check()
    }
    
// Field Check Function
    func check() {
        if !(createAccountUsername.text?.isEmpty)! && !(createAccountPassword.text?.isEmpty)! && !(createAccountPasswordRetype.text?.isEmpty)! {
            enableButton()
        } else {
            disableButton()
        }
    }
    
    
    // Enable/Disable Create Account Button
    func enableButton() {
        createAccountButton.isEnabled = true
        createAccountButton.alpha = 1.0
    }
    func disableButton() {
        createAccountButton.isEnabled = false
        createAccountButton.alpha = 0.5
    }
    
}
