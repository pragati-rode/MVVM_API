//
//  UserCell.swift
//  MVVM_App
//
//  Created by Admin on 10/12/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    var userModel : UserModel?{
        didSet {
            userConfiguration()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func userConfiguration() {
        let status = userModel?.getStatusColor()
                lblStatus.text = status?.0
                backgroundColor = status?.1
               if let id = userModel?.id {
                   lblID.text = "\(id)"
               }else {
                  lblID.text = "No ID"
               }
              
               lblTitle.text = userModel?.title
    }
    
}
