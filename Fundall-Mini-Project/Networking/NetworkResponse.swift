//
//  NetworkResponse.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 26.6.21.
//

import Foundation

struct NetworkResponse<T: Decodable>: Decodable {
    let status: Int?
    let message: String?
    let data: T?
    let error: String?
}
