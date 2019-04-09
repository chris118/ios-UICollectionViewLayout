//
//  ViewController.swift
//  ios-viewlayout
//
//  Created by Chris on 2019/4/8.
//  Copyright © 2019 putao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var items = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initDataSource()
        initViews()
    }
    
    override func viewDidLayoutSubviews() {
    }
    
    private func initViews() {
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(100)
            make.width.equalTo(self.view)
            make.center.equalTo(self.view)
        }
        
        self.collectionView.ts_registerCellNib(PTCollectionViewCell.self)
    }
    
    private func initDataSource() {
        for i in 0...100 {
            items.append("\(i)")
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let viewLayout = TSCollectionViewLayout()
        viewLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        let _collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: viewLayout)
        _collectionView.backgroundColor = UIColor.white
        _collectionView.delegate = self
        _collectionView.dataSource = self
        return _collectionView
    }()
}

// MARK: UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.ts_dequeueReusableCell(PTCollectionViewCell.self, indexPath: indexPath)
        cell.setNumber(number: items[indexPath.row])
        return cell
    }
}

// MARK: UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        return true
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}

