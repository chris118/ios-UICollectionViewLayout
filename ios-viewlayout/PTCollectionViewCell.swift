//
//  PTCollectionViewCell.swift
//  ios-viewlayout
//
//  Created by Chris on 2019/4/8.
//  Copyright © 2019 putao. All rights reserved.
//

import UIKit

class PTCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setNumber(number: String) {
        numberLabel.text = number
    }
}
