//
//  Route.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 26.6.21.
//

import Foundation

enum Route {
    static let baseUrl = "https://campaign.fundall.io"
    
    case register
    case authenticate
    case getUserData
    case updateAvatar
    
    var description: String {
        switch self {
        case .register:
            return "/api/v1/register"
        case .authenticate:
            return "/api/v1/login"
        case .getUserData:
            return "/api/v1/profile"
        case .updateAvatar:
            return "/api/v1/avatar"
        }
    }
}
