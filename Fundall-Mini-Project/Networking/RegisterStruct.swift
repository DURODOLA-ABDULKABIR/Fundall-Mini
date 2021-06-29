//
//  RegisterStruct.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 26.6.21.
//

import Foundation

struct BaseStruct: Decodable {
    let success: Register
}

struct Register: Decodable {
    let message: String
}
