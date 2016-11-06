//
//  EntryStore.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/07/18.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import RxCocoa
import RxSwift

protocol EntryStore {
//    func fetchEntries(query query: String) -> Driver<[Entry]>
    func fetchEntries(query: String) -> Observable<[Entry]>
}
