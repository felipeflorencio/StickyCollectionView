//
//  SCPrimerCollectionViewCell.swift
//  StickyCollectionView
//
//  Created by Felipe Florencio Garcia on 2/4/16.
//  Copyright © 2016 Bogdan Matveev. All rights reserved.
//

import Foundation
import UIKit

class SCPrimerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lessonLabel:UILabel?

    var lesson:NSString {
        get {
            return self.lesson
        }
        set(lesson){
            self.lessonLabel?.text = lesson as String
        }
    }
        
}