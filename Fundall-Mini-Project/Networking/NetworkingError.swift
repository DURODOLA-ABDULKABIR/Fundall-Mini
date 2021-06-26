//
//  NetworkingError.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 26.6.21.
//

import Foundation

enum NetworingError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "Unknown error"
        case .invalidUrl:
            return "Please provide a valid URL"
        case .serverError(let error):
            return error
        }
    }
}
