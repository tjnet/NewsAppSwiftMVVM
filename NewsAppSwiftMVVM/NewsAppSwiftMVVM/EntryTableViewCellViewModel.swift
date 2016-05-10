//
//  EntryTableViewCellViewModel.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/06/05.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import Foundation

class EntryTableViewCellViewModel{
    
    var title: String = ""
    var link: String = ""
    var contentSnippet = ""
    
    init(entry: Entry) {
        title = entry.title
        link = entry.link
        contentSnippet = entry.contentSnippet
    }

 }