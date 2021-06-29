//
//  AuthenticationStruct.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 26.6.21.
//

import Foundation

struct Authentication: Decodable {
    let success: user
}

struct user: Decodable {
    let firstname: String?
    let lastname: String?
    let email: String?
    let avatar: String?
}
