//
//  LoginViewController.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 26.6.21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userName: UILabel!
    let name = UserdefaultManager.shared.defaults?.value(forKey: "name")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.userName.text = "\(String(describing: name as! String))'s "
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
