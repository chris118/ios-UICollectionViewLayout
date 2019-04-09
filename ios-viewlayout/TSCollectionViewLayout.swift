//
//  TSCollectionViewLayout.swift
//  ios-viewlayout
//
//  Created by Chris on 2019/4/8.
//  Copyright © 2019 putao. All rights reserved.
//

import UIKit

class TSCollectionViewLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attrs = super.layoutAttributesForElements(in: rect)
        
        guard let _attrs = attrs else {
            return nil
        }
        
        for attr in _attrs {
            let delta = abs((attr.center.x - self.collectionView!.contentOffset.x) - self.collectionView!.bounds.size.width * 0.5)
            let scale = 1 - delta / (self.collectionView!.bounds.size.width * 0.5) * 0.4
            attr.transform = CGAffineTransform(scaleX: scale, y: scale)
            attr.alpha = scale
        }
        
        return attrs
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        // TODO
        return super.targetContentOffset(forProposedContentOffset: proposedContentOffset)
    }
}
