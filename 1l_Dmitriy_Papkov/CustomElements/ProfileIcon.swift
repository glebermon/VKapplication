//
//  ProfileIcon.swift
//  1l_Dmitriy_Papkov
//
//  Created by Дмитрий Папков on 15/11/2018.
//  Copyright © 2018 Dmitriy Papkov. All rights reserved.
//

import UIKit

class ProfileIcon: UIImageView {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        //
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 50
        self.layer.masksToBounds = true
    }
    

}
