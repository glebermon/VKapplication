//
//  LikeControl.swift
//  1l_Dmitriy_Papkov
//
//  Created by Дмитрий Папков on 15/11/2018.
//  Copyright © 2018 Dmitriy Papkov. All rights reserved.
//

import UIKit

@IBDesignable class LikeControl: UIView {
    private var stack: UIStackView = UIStackView()
    private let button = UIButton(type: .system)
    private let field = UITextField()
    
    private var counter: Int = 0
    private var isLike: Bool = false
    
    private func setupView() {
        button.setTitle("❤️", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.setTitleColor(.white, for: .selected)
        button.addTarget(self, action: #selector(selectLike(_:)), for: .touchUpInside)
        button.isSelected = self.isLike
        
        field.text = String(counter)
        
        stack = UIStackView()
        stack.addArrangedSubview(button)
        stack.addArrangedSubview(field)
        
        self.addSubview(stack)
        
        stack.spacing = 8
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
    }
    
    private func reloadValues() {
        button.isSelected = isLike
        field.text = String(counter)
    }
    
    func configValues(isLike: Bool = false, counter: Int = 0) {
        self.isLike = isLike
        self.counter = counter
        reloadValues()
    }
    
    @objc private func selectLike(_ sender: UIButton) {
        if isLike {
            counter -= 1
        }else{
            counter += 1
        }
        isLike = !isLike
        reloadValues()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stack.frame = bounds
    }
}
