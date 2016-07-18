//
//  EntryAPIService.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/06/23.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxAlamofire


class EntryAPIService {
    enum APIError: ErrorType {
        case CannotParse
    }
    
    let entryStore: EntryStore
    
    init(entryStore: EntryStore) {
        self.entryStore = entryStore
    }
    func fetchEntries(q q: String) -> Driver<[Entry]> {
        return entryStore.fetchEntries(q: q)
    }
    
}