//
//  ViewController.swift
//  1l_Dmitriy_Papkov
//
//  Created by Дмитрий Папков on 19/09/2018.
//  Copyright © 2018 Dmitriy Papkov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardAppeared(_:)),
                                               name: UIResponder.keyboardDidShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWasHidden),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
        scrollView.keyboardDismissMode = .onDrag
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardDidShowNotification,
                                                  object: nil)
        
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardDidHideNotification,
                                                  object: nil)
    }
    
    
    @objc func keyBoardAppeared(_ notification: Notification) {
        if let keyboardInfo = notification.userInfo as NSDictionary? {
            let size = (keyboardInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
            let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: size.height, right: 0)
            self.scrollView.contentInset = contentInset
            self.scrollView.scrollIndicatorInsets = contentInset
        }
    }
    
    @objc func keyBoardWasHidden() {
        self.scrollView.contentInset = UIEdgeInsets.zero
        self.scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
    @IBAction func checkLogin() {
        if loginField.text == "admin" && passwordField.text == String(123456) {
            performSegue(withIdentifier: "loginSuccess", sender: nil)
        }else {
            let alert = UIAlertController(
                title: "Ошибка",
                message: """
                Поробуйте

                Логин: admin
                Пароль: 123456
                """,
                preferredStyle: UIAlertController.Style.alert
            )
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

