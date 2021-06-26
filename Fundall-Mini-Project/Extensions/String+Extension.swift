//
//  String+Extension.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 26.6.21.
//

import Foundation
extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
