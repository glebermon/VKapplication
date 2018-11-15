//
//  Friend.swift
//  1l_Dmitriy_Papkov
//
//  Created by Дмитрий Папков on 08/11/2018.
//  Copyright © 2018 Dmitriy Papkov. All rights reserved.
//

import Foundation
import UIKit

class Friend {
    let firstName: String
    let lastName: String
    let photo: UIImage
    
    init(firstName: String, lastName: String, image: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.photo = UIImage(named:image)!
    }
}
