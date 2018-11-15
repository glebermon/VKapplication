//
//  FriendPhoto.swift
//  1l_Dmitriy_Papkov
//
//  Created by Дмитрий Папков on 10/11/2018.
//  Copyright © 2018 Dmitriy Papkov. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    
    func configureCell(friend: Friend) {
        self.firstName.text = friend.firstName
        self.lastName.text = friend.lastName
        self.photo.image = friend.photo
    }
}
