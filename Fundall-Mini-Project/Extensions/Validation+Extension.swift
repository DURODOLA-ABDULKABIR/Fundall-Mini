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
    public var isValidPassword: Bool {
        NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$").evaluate(with: self)
    }
    public var isValidNumber: Bool {
        NSPredicate(format: "SELF MATCHES %@","^[+]?+[0-9]{5,16}$" ).evaluate(with: self)
    }
}
