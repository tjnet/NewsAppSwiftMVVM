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
    
    func fetchEntries(q q: String) -> Driver<[Entry]> {
        let url = "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/\(q)/rss"
        
        return JSON(.GET, url)
            .asDriver(onErrorJustReturn: [])
            .map({ json -> [Entry] in
                guard let responseData = json["responseData"] as? Dictionary<String, AnyObject> else {return []}
                guard let feed = responseData["feed"] as? Dictionary<String, AnyObject> else {return []}
                guard let entries = feed["entries"] as? [AnyObject] else {return []}
                
                return entries.map { Entry(value: $0) }
                
            })
    }
}