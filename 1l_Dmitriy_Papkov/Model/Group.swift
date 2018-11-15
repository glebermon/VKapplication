//
//  GroupItem.swift
//  1l_Dmitriy_Papkov
//
//  Created by Дмитрий Папков on 08/11/2018.
//  Copyright © 2018 Dmitriy Papkov. All rights reserved.
//

import Foundation
import UIKit

class Group {
    let name: String
    let image: UIImage
    
    init(name: String, image: String) {
        self.name = name
        self.image = UIImage(named: image)!
    }
}
