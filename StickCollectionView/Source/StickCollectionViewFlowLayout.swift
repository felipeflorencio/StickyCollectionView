//
//  StickCollectionViewFlowLayout.swift
//  StickyCollectionView
//
//  Created by Felipe Florencio Garcia on 2/3/16.
//  Copyright © 2016 Bogdan Matveev. All rights reserved.
//

import Foundation
import UIKit

class StickCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    var firstItemTransform:CGFloat?

    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let allItems:NSArray = super.layoutAttributesForElementsInRect(rect)!
        
        var headerAttributes:UICollectionViewLayoutAttributes?
        
        allItems.enumerateObjectsUsingBlock({ object, index, stop in
            let attributes:UICollectionViewLayoutAttributes? = object as? UICollectionViewLayoutAttributes
            
            if attributes?.representedElementKind == UICollectionElementKindSectionHeader {
                headerAttributes = attributes
            } else {
                self.updateCellAttributes(attributes!, headerAttributes:headerAttributes!)
            }
        })
        
        return allItems as? [UICollectionViewLayoutAttributes]
    }
    
    func updateCellAttributes(attributes: UICollectionViewLayoutAttributes, headerAttributes:UICollectionViewLayoutAttributes) -> Void {
        
        let minY:CGFloat = CGRectGetMinY((self.collectionView?.bounds)!) + (self.collectionView?.contentInset.top)!
        let maxY:CGFloat = attributes.frame.origin.y - CGRectGetHeight(headerAttributes.bounds)
        let finalY:CGFloat = max(minY, maxY)
        
        var origin:CGPoint = attributes.frame.origin
        
        let deltaY:CGFloat = (finalY - origin.y) / CGRectGetHeight(attributes.frame)
        
        if let _ = self.firstItemTransform {
            attributes.transform = CGAffineTransformMakeScale((1 - deltaY * self.firstItemTransform!), (1 - deltaY * self.firstItemTransform!))
        }
        
        origin.y = finalY
        attributes.frame = CGRect(origin: origin, size: attributes.frame.size)
        attributes.zIndex = attributes.indexPath.row
        
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true;
    }
    
}