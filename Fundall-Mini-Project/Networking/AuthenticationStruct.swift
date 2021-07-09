//
//  AuthenticationStruct.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 26.6.21.
//

import Foundation


struct Authentication: Codable {
    let success: Success
}

struct Success: Codable {
    let user: User
    let status: String
}

struct User: Codable {
    let id: Int
    let firstname, lastname, email: String
    let avatar: String
    let monthlyTarget: Int
    let createdAt, updatedAt, accessToken, tokenType: String
    let expiresAt: String

    enum CodingKeys: String, CodingKey {
        case id, firstname, lastname, email, avatar
        case monthlyTarget = "monthly_target"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresAt = "expires_at"
    }
}
