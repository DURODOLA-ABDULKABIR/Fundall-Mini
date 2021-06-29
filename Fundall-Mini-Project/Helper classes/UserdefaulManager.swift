//
//  UserdefaulManager.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 28.6.21.
//

import Foundation

class UserdefaultManager {
    static let shared = UserdefaultManager()
    let defaults = UserDefaults(suiteName: "com.fundall.saved.data")
    
    func  getEmail(_ email: String) {
        defaults?.setValue(email, forKey: "email")
    }
    
    func getPassword(_ password: String) {
        defaults?.setValue(password, forKey: "password")
    }
}
