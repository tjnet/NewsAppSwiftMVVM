//
//  EntryStore.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/07/18.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import RxCocoa

protocol EntryStore {
    func fetchEntries(q q: String) -> Driver<[Entry]>
}
