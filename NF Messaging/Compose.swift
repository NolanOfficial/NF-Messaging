//
//  Compose.swift
//  NF Messaging
//
//  Created by Nolan Fuchs on 12/5/18.
//  Copyright © 2018 Nolan Fuchs. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Compose: UIViewController {
    
    @IBOutlet weak var searchEngine: UISearchBar!
    @IBOutlet weak var searchView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchEngine.resignFirstResponder()
    }
    
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
