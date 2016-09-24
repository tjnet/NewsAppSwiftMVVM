//
//  UIViewController+style.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/09/24.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import Foundation
import FontAwesomeKit

extension UIViewController {
    
    func imageFromAFont(icon : FAKFontAwesome)-> UIImage {
        
        icon.addAttribute(NSForegroundColorAttributeName, value: UIColor.blackColor())
        
        return icon.imageWithSize(CGSizeMake(icon.iconFontSize, icon.iconFontSize))
        
    }
}
