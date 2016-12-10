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
    
    class func titleHeightWithText(_ titleText: String, cellWidth: CGFloat) -> CGFloat {
        let padding: CGFloat = 1.0
        let width: CGFloat = (cellWidth - padding * 2)
        let font = UIFont.systemFont(ofSize: 14.0)
        let attributes = [NSFontAttributeName:font]
        
        let titleRect: CGRect = (titleText as NSString).boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude),
                                                                     options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                                     attributes: attributes,
                                                                     context: nil)
        
        return padding + ceil(titleRect.size.height) + padding
    }
}
