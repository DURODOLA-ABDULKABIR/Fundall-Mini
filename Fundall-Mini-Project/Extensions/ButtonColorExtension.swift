//
//  ButtonColorExtension.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 26.6.21.
//

import UIKit

extension UIColor{
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat){
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static var lemoncolor: UIColor = {
        return UIColor(r: 76, g: 232, b: 149)
    }()
}
