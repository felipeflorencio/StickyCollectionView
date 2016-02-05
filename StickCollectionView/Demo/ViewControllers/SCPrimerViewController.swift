//
//  SCPrimerViewController.swift
//  StickyCollectionView
//
//  Created by Felipe Florencio Garcia on 2/3/16.
//  Copyright © 2016 Bogdan Matveev. All rights reserved.
//

import Foundation
import UIKit

struct Resolution {
    var cellSizeCoef:CGFloat = 0.8
    var firstItemTransform:CGFloat = 0.05
}

class SCPrimerViewController: UIViewController {
    
    // Contants
    let kDemoCell:NSString = "primerCell"
  
    
    @IBOutlet weak var collectionView:UICollectionView?
    var lessonsArray:NSArray?
    
    
    override func viewDidLoad() {
        self.lessonsArray = ["Create a Hight Quality, High Ranking Search Ad",
        "Evolve Your Ad Campaigns with Programmatic Buying",
        "How Remarketing Keeps Customers Coming Back",
        "Surviving and Thriving on Social Media",
        "Keep Mobile Users Engaged In and Out of Your App",
        "Appeal to Searchers and Search Engines with Seo",
        "Build Your Business Fast with Growth Hacking",
        "Track Your Acquisitions with Digital Metricks"]
        
        
        let stickLayout:StickCollectionViewFlowLayout = self.collectionView!.collectionViewLayout as! StickCollectionViewFlowLayout;
        
        stickLayout.firstItemTransform = Resolution().firstItemTransform;
    }
    
//MARK -=CollectionView datasource=-

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.lessonsArray!.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        let cell:SCPrimerCollectionViewCell = self.collectionView?.dequeueReusableCellWithReuseIdentifier(kDemoCell as String, forIndexPath: indexPath) as! SCPrimerCollectionViewCell
        let lesson:NSString = self.lessonsArray![indexPath.row] as! NSString
        cell.lesson = lesson
        
        return cell
    }

//MARK -=CollectionView layout=-
    
    
    
    
    
    
    
    
    
}