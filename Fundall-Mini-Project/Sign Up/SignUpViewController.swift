//
//  ViewController.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 25.6.21.
//

import UIKit

class SignUpViewController: UIViewController {
    let setUp = SetUp()
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var benefitsButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        cancelButton.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont(name: "Arial", size: 11)!], for: UIControl.State.normal)
        benefitsButton.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont(name: "Arial", size: 11)!], for: UIControl.State.normal)
        
        setUp.setUpTextField(firstNameTextField)
        setUp.setUpTextField(passwordTextField)
        setUp.setUpTextField(phoneNumberTextField)
        setUp.setUpTextField(emailTextField)
        setUp.setUpTextField(lastNameTextField)
        setUp.setLeftTextFieldImage(firstNameTextField, "user")
        setUp.setLeftTextFieldImage(phoneNumberTextField, "phone-call")
        setUp.setLeftTextFieldImage(emailTextField, "conversation")
        setUp.setLeftTextFieldImage(lastNameTextField, "user")
        setUp.setLeftTextFieldImage(passwordTextField, "Key")
        setUp.setRighTextFieldImage(passwordTextField, "Disable Eye")
        
        signUpButton.layer.cornerRadius = 3
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        let firstName = firstNameTextField.text
        let lastName = lastNameTextField.text
        let email = emailTextField.text
        let phoneNumber = phoneNumberTextField.text
        let password = passwordTextField.text
        let confirmPassword = passwordTextField.text
        let params = ["firstname": firstName, "lastname": lastName, "email": email, "password": password, "password_confirmation": confirmPassword]
        NetworkService.shared.register(parameters: params) { (result) in
            switch result {
            case .success(let message):
                print("Showing\(message)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
        let LoginVC = UIStoryboard(name: "Login", bundle: nil)
        let LoginIdentifier = LoginVC.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(LoginIdentifier, animated: true)
    }
    
    
}

