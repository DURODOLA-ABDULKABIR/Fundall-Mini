//
//  AnalyticsViewController.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 28.6.21.
//

import UIKit

class AnalyticsViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let titleTextAttributes2 = [NSAttributedString.Key.foregroundColor: UIColor.fundalPrimaryGreen]
        
        segmentedControl.setTitleTextAttributes(titleTextAttributes2, for: .normal)
        segmentedControl.setTitleTextAttributes(titleTextAttributes, for: .selected)
        
        self.table.delegate = self
        self.table.dataSource = self
        self.table.register(UINib.init(nibName: "TopMerchantsTableViewCell", bundle: nil), forCellReuseIdentifier: "TopMerchantsTableViewCell")
    }
    
        
    let names = ["PizzaHut", "Amazon", "Subway"]
    let transactions = ["4 transactions", "3 transactions", "2 transactions"]
    let amounts = ["₦200", "₦180", "₦125"]
    let imageNames = ["Pizz", "Amazon-1", "Subway"]
}

extension AnalyticsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = table.dequeueReusableCell(withIdentifier: "TopMerchantsTableViewCell", for: indexPath) as! TopMerchantsTableViewCell
            cell.amountLabel.text = amounts[indexPath.row]
            cell.cellImage.image = UIImage(named: imageNames[indexPath.row])
            cell.numberOfTransactionsLabel.text = transactions[indexPath.row]
            cell.nameLabel.text = names[indexPath.row]
            return cell
            
        
        
        //return UITableViewCell()
    }
    
    
}
