//
//  MyCustomTableViewCell.swift
//  MobileCandidate
//
//  Created by Cristian Piña on 29/08/22.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImage.layer.cornerRadius = 55
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
