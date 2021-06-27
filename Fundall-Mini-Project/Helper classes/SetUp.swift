//
//  SetUp.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 26.6.21.
//

import UIKit

class SetUp {
    func setUpTextField(_ textField: UITextField) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: textField.frame.height - 1, width: textField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.lemoncolor.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
    }
    
    func setRighTextFieldImage(_ textField: UITextField, _ imageName: String) {
        textField.rightViewMode = .always
        let userImageViewText = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 16))
        let image = UIImage(named: imageName)
        userImageViewText.image = image
        textField.rightView = userImageViewText
    }
    
    func setLeftTextFieldImage(_ textField: UITextField, _ imageName: String) {
        let envelopeView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
         let image = UIImage(named: imageName)
        envelopeView.image = image
        let viewLeft: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 45, height: 30))
        viewLeft.addSubview(envelopeView)
        textField.leftView = viewLeft
        textField.leftViewMode = .always
    }
}
