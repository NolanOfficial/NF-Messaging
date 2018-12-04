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

class CreatAccountScreen: UIViewController {

    @IBOutlet weak var createAccountUsername: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var createAccountPassword: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var createAccountPasswordRetype: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var accountMessage: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        accountMessage.isHidden = true
        activityIndicator.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createAccountAction(_ sender: Any) {
        print("Creating Account...")
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        accountMessage.isHidden = true
        createAccountUsername.resignFirstResponder()
        createAccountPassword.resignFirstResponder()
        createAccountPasswordRetype.resignFirstResponder()
        
       
        if createAccountPassword.text == createAccountPasswordRetype.text {
            
        Auth.auth().createUser(withEmail: createAccountUsername.text!, password: createAccountPassword.text!) { (user, error) in
            if user != nil {
                    self.activityIndicator.isHidden = true
                    self.activityIndicator.stopAnimating()
                    self.accountMessage.isHidden = false
                    self.accountMessage.text = "Account Created"
                    self.accountMessage.textColor = .green
                    self.accountMessage.isHidden = false
                    self.performSegue(withIdentifier: "goToHomeScreen", sender: self)
            } else {
                self.activityIndicator.isHidden = true
                self.activityIndicator.stopAnimating()
                self.accountMessage.text = "Error. Please Try Again"
                self.accountMessage.textColor = .red
                self.accountMessage.isHidden = false
                print(error?.localizedDescription ?? "Fatal Error")
                }
            
            }
        
        } else {
            print("Passwords Do Not Match")
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
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
    
    
    
}
