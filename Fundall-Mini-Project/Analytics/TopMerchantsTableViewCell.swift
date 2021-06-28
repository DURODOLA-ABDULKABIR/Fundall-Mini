//
//  TopMerchantsTableViewCell.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 28.6.21.
//

import UIKit

class TopMerchantsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImageView: UIView!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var numberOfTransactionsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        cellImageView.layer.cornerRadius = 15
        cellImageView.layer.shadowColor = UIColor.black.cgColor
        cellImageView.layer.shadowOffset = CGSize(width: 3, height: 3)
        cellImageView.layer.shadowOpacity = 0.1
        cellImageView.layer.shadowRadius = 4.0
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
