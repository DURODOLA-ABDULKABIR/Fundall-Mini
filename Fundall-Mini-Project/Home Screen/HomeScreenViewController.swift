//
//  HomeScreenViewController.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 27.6.21.
//

import UIKit

class HomeScreenViewController: UIViewController {

    
    
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var cardView1: UIView!
    @IBOutlet weak var cardView2: UIView!
    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var greyLabelView: UIView!
    @IBOutlet weak var amounView: UIView!
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var greyLabel: UIView!
    @IBOutlet weak var headerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        }
    
    func setUpView() {
        headerView.clipsToBounds = true
        footerView.clipsToBounds = true
        headerView.roundCorners([.bottomLeft, .bottomRight], radius: 10)
        amounView.layer.cornerRadius = 18
        greyLabelView.layer.cornerRadius = 18
        sideView.roundCorners([.topLeft, .bottomLeft], radius: 10)
        cardView1.layer.cornerRadius = 10
        cardView2.layer.cornerRadius = 10
        footerView.layer.cornerRadius = 50
        footerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        topBarView.layer.cornerRadius = 5

    }
    
    @IBAction func analyticsClicked(_ sender: UIButton) {
        let  storyboardName = UIStoryboard(name: "Analytics", bundle: nil)
        let loginIdentifier = storyboardName.instantiateViewController(identifier: "AnalyticsViewController") as! AnalyticsViewController
        navigationController?.pushViewController(loginIdentifier, animated: true)

    }
    @IBAction func requestCardClicked(_ sender: UIButton) {
        let  storyboardName = UIStoryboard(name: "UserCard", bundle: nil)
        let loginIdentifier = storyboardName.instantiateViewController(identifier: "UserCardViewController") as! UserCardViewController
        navigationController?.pushViewController(loginIdentifier, animated: true)
    }
    
    @IBAction func viewAllClicked(_ sender: UIButton) {
        let  storyboardName = UIStoryboard(name: "Cards", bundle: nil)
        let loginIdentifier = storyboardName.instantiateViewController(identifier: "CardsViewController") as! CardsViewController
        navigationController?.pushViewController(loginIdentifier, animated: true)

    }
    
}
