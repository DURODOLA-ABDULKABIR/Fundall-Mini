//
//  LoginViewController.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 26.6.21.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }

    @IBAction func createAccountClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
