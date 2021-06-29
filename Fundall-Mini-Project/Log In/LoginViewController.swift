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

    @IBAction func passwordClicked(_ sender: UIButton) {
        let LoginVC = UIStoryboard(name: "LoginHomeScreen", bundle: nil)
        let LoginIdentifier = LoginVC.instantiateViewController(identifier: "LoginHomeScreenViewController") as! LoginHomeScreenViewController
        navigationController?.pushViewController(LoginIdentifier, animated: true)
    }
    
    @IBAction func createAccountClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
