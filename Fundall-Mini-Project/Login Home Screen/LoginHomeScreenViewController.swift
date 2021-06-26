//
//  LoginHomeScreenViewController.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 26.6.21.
//

import UIKit

class LoginHomeScreenViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    let setUp = SetUp()

    @IBOutlet weak var loginPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        setUp.setUpTextField(loginPasswordTextField)
        setUp.setRighTextFieldImage(loginPasswordTextField, "Disable Eye")
        loginButton.layer.cornerRadius = 3
    }
    
}

