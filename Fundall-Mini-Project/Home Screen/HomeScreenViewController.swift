//
//  HomeScreenViewController.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 27.6.21.
//

import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        }
    
    func setUpView() {
        headerView.clipsToBounds = true
        headerView.layer.cornerRadius = 10
        headerView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]

    }
}
