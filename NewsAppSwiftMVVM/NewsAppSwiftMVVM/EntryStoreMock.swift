//
//  EntryStoreMock.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/07/18.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import RxCocoa
import RxAlamofire


class EntryStoreMock: EntryStore {
    func fetchEntries(q q: String) -> Driver<[Entry]> {
        
        let entry = Entry()
        entry.title = "title1"
        entry.link = "https://example.com/articles/1"
        entry.contentSnippet = "今日はとてもいい天気..."
        
        return Driver.just([Entry](arrayLiteral: entry))
    }
}
