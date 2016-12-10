//
//  EntriesCollectionViewCell.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/10/25.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import UIKit
import AVFoundation

class EntriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var caption: UILabel!
    
    func configure(entry: Entry) {

        self.caption.text = entry.title
        if let thumb = URL(string: entry.thumbnail) {
            imageView.sd_setImage(with: thumb)
        }
        
    }
    
    class func imageHeightWithImage(_ image: UIImage, cellWidth: CGFloat) -> CGFloat {
        let boundingRect: CGRect  =  CGRect(x: 0, y: 0, width: cellWidth, height: CGFloat.greatestFiniteMagnitude)
        let rect: CGRect = AVMakeRect(aspectRatio: image.size, insideRect: boundingRect)
        
        return rect.size.height;
    }
}
