//
//  AlphabetPicker.swift
//  1l_Dmitriy_Papkov
//
//  Created by Дмитрий Папков on 15/11/2018.
//  Copyright © 2018 Dmitriy Papkov. All rights reserved.
//

import UIKit

class AlphabetPicker: UIView {
    
    var delegate: AlphabetPickerDelegate?
    private var stack: UIStackView = UIStackView()
    private var buttons: [UIButton] = [UIButton]()
    
    func setupView(chars: [Character]) {
        for char in chars {
            let button = UIButton()
            button.setTitle(String(char), for: .normal)
            button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.addTarget(self, action: #selector(charAction(_:)), for: .touchUpInside)
            self.buttons.append(button)
        }
        stack = UIStackView(arrangedSubviews: self.buttons)
        self.addSubview(stack)
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillEqually
    }
    
    @objc func charAction(_ sender: UIButton) {
        guard let delegate = self.delegate else {return}
        guard let text = sender.titleLabel?.text else {return}
        delegate.charSelected(buttonValue: text)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stack.frame = bounds
    }
}

protocol AlphabetPickerDelegate {
    func charSelected(buttonValue: String)
}
