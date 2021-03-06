//
//  HomeScreen.swift
//  NF Messaging
//
//  Created by Nolan Fuchs on 12/3/18.
//  Copyright © 2018 Nolan Fuchs. All rights reserved.
//

import UIKit
import Firebase

var docRef: DocumentReference?


class HomeScreen: UIViewController {

    @IBOutlet weak var addMessageButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var user = Auth.auth().currentUser
  

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func logoutAction(_ sender: Any) {
        print("Logging Out...")
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            dismiss(animated: true, completion: nil)
            print("Succesfully Logged Out")
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }


    @IBAction func addNewMessage(_ sender: Any) {
        
        
        
        
        
    }

}

