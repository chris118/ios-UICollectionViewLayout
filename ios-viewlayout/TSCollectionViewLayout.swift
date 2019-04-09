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
//        let collectionViewWidth = super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: <#T##CGPoint#>)
        return super.targetContentOffset(forProposedContentOffset: proposedContentOffset)
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        guard let _collectionView = collectionView else {
            return CGPoint(x: 0, y: 0)
        }
        
        let collectionWidth = self.collectionView?.bounds.size.width ?? CGFloat(0)

        // 最终偏移量
        var targetPoint = super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        
        // 获取最终显示的区域
        let targetRect = CGRect(x: targetPoint.x, y: CGFloat(0), width: collectionWidth, height: CGFloat(MAXFLOAT))

        // 获取最终显示的cell
        let attrs = self.layoutAttributesForElements(in: targetRect)
        
        guard let _attrs = attrs else {
            return targetPoint
        }
        
        var minDelta = CGFloat(MAXFLOAT)
        for attr in _attrs {
            let delta = (attr.center.x - targetPoint.x) - _collectionView.bounds.size.width * 0.5
            if abs(delta) < abs(minDelta) {
                minDelta = delta
            }
        }
        
        // 移动间距
        targetPoint.x += minDelta;
        
        if targetPoint.x < 0 {
            targetPoint.x = 0;
        }
        
        return targetPoint;
        
    }
}
