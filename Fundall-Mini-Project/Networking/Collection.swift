//
//  Collection.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 4.7.21.
//

import Foundation
enum Collection {
    case user
    case identity
    
    var identifier: String {
        switch self {
        case .user:
            return "user"
        case.identity:
            return "id"
        }
    }
}
