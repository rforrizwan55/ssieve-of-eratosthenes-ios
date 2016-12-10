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
    
    //preparing cell for reuse
    override func prepareForReuse() {
        self.backgroundColor = UIColor.clearColor()
    }
    
    //settings for cell
    override func layoutSubviews() {
         Lbl.textAlignment = NSTextAlignment.Center //aligning text to center
        self.layer.cornerRadius = 20 // rounded border
        
    }
    
}