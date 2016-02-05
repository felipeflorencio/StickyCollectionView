//
//  SCWelcomeViewController.swift
//  StickyCollectionView
//
//  Created by Felipe Florencio Garcia on 2/3/16.
//  Copyright © 2016 Bogdan Matveev. All rights reserved.
//

import Foundation
import UIKit

class SCWelcomeViewController: UIViewController {
 
    @IBOutlet weak var backgroundImageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blurEffect:UIVisualEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let visualEffectView = UIVisualEffectView.init(effect: blurEffect)
        
        visualEffectView.frame = (self.backgroundImageView?.bounds)!
        self.backgroundImageView?.addSubview(visualEffectView)
    }
    
    
}