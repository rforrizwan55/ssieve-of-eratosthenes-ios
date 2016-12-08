//
//  NumberCell.swift
//  Procore_Sieve_of_Era
//
//  Created by Abdul Raqeeb on 12/7/16.
//  Copyright © 2016 Abdul Raqeeb. All rights reserved.
//

import UIKit

class NumberCell: UICollectionViewCell {
    
    @IBOutlet weak var Lbl: UILabel!
    
    override func prepareForReuse() {
        self.backgroundColor = UIColor.clearColor()
    }
    override func layoutSubviews() {
         Lbl.textAlignment = NSTextAlignment.Center
    }
    
}