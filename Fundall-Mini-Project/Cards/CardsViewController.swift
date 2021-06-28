//
//  CardsViewController.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 28.6.21.
//

import UIKit

class CardsViewController: UIViewController {
    
    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var cardsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cardsCollectionView.dataSource = self
        topBarView.layer.cornerRadius = 5
    }
    
    let cards = ["Fundall Lifestyle Card", "Rave Dollar Card", "Bitcoin Wallet" ]
    
}


extension CardsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cardsCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.layer.cornerRadius = 10
        cell.cellText.text = cards[indexPath.row]
        return cell
    }
    
    
}
