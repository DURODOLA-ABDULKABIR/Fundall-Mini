//
//  ViewController.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 25.6.21.
//

import UIKit

class SignUpViewController: UIViewController {
    let setUp = SetUp()
    
    var fieldValidation = textValidation()
    
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
        let loginIdentifier = storyboardName.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(loginIdentifier, animated: true)
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
        guard let firstName = firstNameTextField.text else { print("hello")
            return }
        guard let lastName = lastNameTextField.text else {return}
        guard let email = emailTextField.text else {return}
        guard let phoneNumber = phoneNumberTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        guard let confirmPassword = passwordTextField.text else {return}
        
        fieldValidation.validateFirstNameFields(firstName, self)
        fieldValidation.validateLastNameFields(lastName, self)
        fieldValidation.validateEmail(email, self)
        fieldValidation.validatePhoneNumber(phoneNumber, self)
        fieldValidation.validatePassword(password, self)
        
        UserdefaultManager.shared.getEmail(email)
        UserdefaultManager.shared.getPassword(password)
        UserdefaultManager.shared.getUserName(firstName)
        
        let params = ["firstname": firstName, "lastname": lastName, "email": email, "password": password, "password_confirmation": confirmPassword]
        NetworkService.shared.register(parameters: params as [String : Any]) { (result) in
            
            switch result {
            case .success(_):
                self.segueToLogin()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func segueToLogin() {
        let  storyboardName = UIStoryboard(name: "Login", bundle: nil)
        let loginIdentifier = storyboardName.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(loginIdentifier, animated: true)
    }
}

