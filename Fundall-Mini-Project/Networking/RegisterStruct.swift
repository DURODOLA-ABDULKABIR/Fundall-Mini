//
//  RegisterStruct.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 26.6.21.
//

import Foundation

struct Register: Decodable {
    let firstname: String?
    let lastname: String?
    let email: String?
    let password: String?
    let password_confirmation: String?
}
