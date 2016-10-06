//
//  EntryStoreImpl.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/07/18.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import RxCocoa
import RxAlamofire


class EntryStoreImpl: EntryStore {
    func fetchEntries(query query: String) -> Driver<[Entry]> {
        let url = "https://private-13084-devnewsapi.apiary-mock.com/\(query)"
        
        return JSON(.GET, url)
            .asDriver(onErrorJustReturn: []) //Builder just needs info about what to return in case of error.
            .map({ json -> [Entry] in
                guard let responseData = json["responseData"] as? Dictionary<String, AnyObject> else {return []}
                guard let feed = responseData["feed"] as? Dictionary<String, AnyObject> else {return []}
                guard let entries = feed["entries"] as? [AnyObject] else {return []}
                
                return entries.map { Entry(value: $0) }
                
            })
    }
}
