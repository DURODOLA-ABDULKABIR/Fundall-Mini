//
//  LoginHomeScreenViewController.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 26.6.21.
//

import UIKit

class LoginHomeScreenViewController: UIViewController {
    
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    let setUp = SetUp()
    let signUpVC = SignUpViewController()
    let email = UserdefaultManager.shared.defaults?.value(forKey: "email")


    @IBOutlet weak var loginPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        navigationController?.navigationBar.isHidden = true
            
    }
    
    func setUpView() {
        setUp.setUpTextField(loginPasswordTextField)
        setUp.setRighTextFieldImage(loginPasswordTextField, "Disable Eye")
        loginButton.layer.cornerRadius = 3
        userEmailLabel.text = email as? String
    }
    
    func segueToHomeScreen() {
        let  storyboardName = UIStoryboard(name: "HomeScreen", bundle: nil)
        let loginIdentifier = storyboardName.instantiateViewController(identifier: "HomeScreenViewController") as! HomeScreenViewController
        navigationController?.pushViewController(loginIdentifier, animated: true)
    }
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        guard let password = loginPasswordTextField.text else {return}
        let params = ["email": email, "password": password]
        NetworkService.shared.login(parameters: params as [String : Any]) { (result) in
            switch result {
            case .success(let output):
                print(output)
                self.segueToHomeScreen()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func createAccountClicked(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}

