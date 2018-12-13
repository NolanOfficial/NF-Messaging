//
//  MessageDetail.swift
//  NF Messaging
//
//  Created by Nolan Fuchs on 12/4/18.
//  Copyright © 2018 Nolan Fuchs. All rights reserved.
//

import Foundation
import UIKit
import Firebase


class MessageDetail: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var senderTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    
       
    
    }
    
    
    
    
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
