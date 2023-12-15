//
//  CustomCell.swift
//  MySampleIOSApp
//
//  Created by Zyauddin Khan on 14/12/23.
//

import UIKit

class CustomCell: UITableViewCell {

    // Link those IBOutlets with the UILabels in your .XIB file
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var userLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    
    override func layoutSubviews() {
        profileImg.layer.cornerRadius = profileImg.frame.height / 2
    }

}
