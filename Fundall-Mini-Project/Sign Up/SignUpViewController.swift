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
    
    @IBAction func loginClicked(_ sender: UIButton) {
        let storyboardName = UIStoryboard(name: "Login", bundle: nil)
        let LoginIdentifier = storyboardName.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(LoginIdentifier, animated: true)
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
    
    func segueToLogin() {
        let  storyboardName = UIStoryboard(name: "Login", bundle: nil)
        let loginIdentifier = storyboardName.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(loginIdentifier, animated: true)
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        let firstName = firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastName = lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let phoneNumber = phoneNumberTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let confirmPassword = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        let params = ["firstname": firstName, "lastname": lastName, "email": email, "password": password, "password_confirmation": confirmPassword]
                NetworkService.shared.register(parameters: params as [String : Any]) { (result) in
            switch result {
            case .success(let message):
                print("Showing\(message)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func validateTextFields() {
        <#function body#>
    }
    
    
}

