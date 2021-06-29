//
//  Validation+Extension.swift
//  CowrywiseApp
//
//  Created by Decagon on 12.5.21.
//

import UIKit

extension String{
        public var isValidEmail: Bool {
            NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
        }
   
    public var isValidPhoneNumber: Bool {
        NSPredicate(format: "SELF MATCHES %@","^[+]?+[0-9]{5,16}$" ).evaluate(with: self)
    }
}

class textValidation {
    func validateFirstNameFields(_ firstName: String, _ viewcontroller: UIViewController){
        if firstName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            AlertController.showAlert(viewcontroller, title: "ERROR", message: "The first name field is required.")
            return
        }
    }
    
    func validateLastNameFields(_ firstName: String, _ viewcontroller: UIViewController){
        if firstName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            AlertController.showAlert(viewcontroller, title: "ERROR", message: "The last name field is required.")
        }
    }
    
    func validateEmail(_ email: String, _ viewcontroller: UIViewController) {
        if email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || !email.isValidEmail {
            AlertController.showAlert(viewcontroller, title: "ERROR", message: "Please enter a valid email.")
        }
    }
    
    func validatePassword(_ password: String, _ viewcontroller: UIViewController) {
        if password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || password.count < 6 {
            AlertController.showAlert(viewcontroller, title: "ERROR", message: "Password should be at least six characters long.")
        }
    }
    
    func validatePhoneNumber(_ phoneNumber: String, _ viewcontroller: UIViewController) {
        if phoneNumber.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || !phoneNumber.isValidPhoneNumber {
            AlertController.showAlert(viewcontroller, title: "ERROR", message: "Please enter a valid phone.")
        }
    }
}
