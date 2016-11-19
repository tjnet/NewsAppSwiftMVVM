//
//  Entry.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/05/11.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import Foundation
import RealmSwift

class Entry: Object {
    
    dynamic var title: String = ""
    dynamic var link: String = ""
    dynamic var contentSnippet: String = ""
    dynamic var thumbnail: String = ""
}


func == (lhs: Entry, rhs: Entry) -> Bool {
    return lhs.title == rhs.title && lhs.link == rhs.link && lhs.contentSnippet == rhs.contentSnippet
}
