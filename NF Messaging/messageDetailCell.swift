//
//  messageDetailCell.swift
//  NF Messaging
//
//  Created by Nolan Fuchs on 12/4/18.
//  Copyright © 2018 Nolan Fuchs. All rights reserved.
//

import UIKit
import Firebase


class messageDetailCell: UITableViewCell {
    
    @IBOutlet weak var recipientImage: UIImageView!
    @IBOutlet weak var recipientName: UILabel!
    @IBOutlet weak var previewMessage: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    

    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
