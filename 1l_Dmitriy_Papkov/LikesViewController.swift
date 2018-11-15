//
//  LikesViewController.swift
//  1l_Dmitriy_Papkov
//
//  Created by Дмитрий Папков on 15/11/2018.
//  Copyright © 2018 Dmitriy Papkov. All rights reserved.
//

import UIKit

class LikesViewController: UIViewController, AlphabetPickerDelegate {

    @IBOutlet weak var firstLV: LikeControl!
    @IBOutlet weak var secondLV: LikeControl!
    @IBOutlet weak var thridLV: LikeControl!
    @IBOutlet weak var alphabetPicker: AlphabetPicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstLV.configValues()
        secondLV.configValues(isLike: true, counter: 10)
        thridLV.configValues(isLike: false, counter: 231)
        alphabetPicker.delegate = self
        alphabetPicker.setupView(chars: ["А", "Б", "В"])
    }
    
    func charSelected(buttonValue: String) {
        print("Выбранный символ \(buttonValue)")
    }
}
