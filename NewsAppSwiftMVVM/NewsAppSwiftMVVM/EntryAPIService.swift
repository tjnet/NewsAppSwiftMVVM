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
    enum APIError: Error {
        case CannotParse
    }
    
    let entryStore: EntryStore
    
    init(entryStore: EntryStore) {
        self.entryStore = entryStore
    }
    func fetchEntries(query: String) -> Observable<[Entry]> {
        return entryStore.fetchEntries(query: query)
    }
    
}
