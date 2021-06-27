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
    let signUpVC = SignUpViewController()

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
    
    @IBAction func createAccountClicked(_ sender: UIButton) {
        
        let password = loginPasswordTextField.text
        let email = signUpVC.emailTextField.text
        let params = ["email": email, "password": password]
        NetworkService.shared.login(parameters: params as [String : Any]) { (result) in
            switch result {
            case .success(let output):
                print(output)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        navigationController?.popToRootViewController(animated: true)
    }
    
}

