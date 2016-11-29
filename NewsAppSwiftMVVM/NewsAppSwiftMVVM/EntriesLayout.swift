//
//  PinterestLayout.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/11/28.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import UIKit

protocol EntriesLayoutDelegate {

    func collectionView(collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:NSIndexPath,
                        withWidth:CGFloat) -> CGFloat

    func collectionView(collectionView: UICollectionView,
                        heightForAnnotationAtIndexPath indexPath: NSIndexPath, withWidth width: CGFloat) -> CGFloat
}

class EntriesLayout: UICollectionViewLayout {
    
    var delegate: EntriesLayoutDelegate!
    
    var numberOfColumns = 2
    var cellPadding: CGFloat = 6.0
    
    private var cache = [UICollectionViewLayoutAttributes]()
    
    private var contentHeight: CGFloat = 0.0
    
    private var contentWidth: CGFloat {
        let insets = collectionView!.contentInset
        return collectionView!.bounds.width - (insets.left + insets.right)
    }
    
    
    

}
