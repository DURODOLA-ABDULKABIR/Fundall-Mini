//
//  AnalyticsViewController.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 28.6.21.
//

import UIKit

class AnalyticsViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let titleTextAttributes2 = [NSAttributedString.Key.foregroundColor: UIColor.fundalPrimaryGreen]

            segmentedControl.setTitleTextAttributes(titleTextAttributes2, for: .normal)
            segmentedControl.setTitleTextAttributes(titleTextAttributes, for: .selected)

    }
    
}
