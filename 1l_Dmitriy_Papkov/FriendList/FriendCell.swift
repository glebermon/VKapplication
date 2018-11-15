//
//  FriendCell.swift
//  1l_Dmitriy_Papkov
//
//  Created by Дмитрий Папков on 08/11/2018.
//  Copyright © 2018 Dmitriy Papkov. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(friend: Friend) {
        self.label.text = "\(friend.firstName) \(friend.lastName)"
        self.photo.image = friend.photo
    }
}
