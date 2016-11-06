//
//  EntryStoreImpl.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/07/18.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import RxCocoa
import RxAlamofire
import RxSwift


class EntryStoreImpl: EntryStore {
    
//    func fetchEntries(query: String) -> Driver<[Entry]> {
//        let url = "https://private-13084-devnewsapi.apiary-mock.com/\(query)"
//        
////        return JSON(.GET, url)
//        return RxAlamofire.requestJSON(.get, url)
//            .asDriver(onErrorJustReturn: (HTTPURLResponse(), []))//Builder just needs info about what to return in case of error.
//            .map({ json -> [Entry] in
//                
//                
//                guard let responseData = json["responseData"] as? Dictionary<String, AnyObject> else {return []}
//                guard let feed = responseData["feed"] as? Dictionary<String, AnyObject> else {return []}
//                guard let entries = feed["entries"] as? [AnyObject] else {return []}
//                
//                return entries.map { Entry(value: $0) }
//                
//            })
//    }
    
    func fetchEntries(query: String) -> Observable<[Entry]> {
        let url = "https://private-13084-devnewsapi.apiary-mock.com/\(query)"
        
        //        return JSON(.GET, url)
        return RxAlamofire
            .requestJSON(.get, url)
            .flatMap { response, data -> Observable<[Entry]> in
                
                guard response.statusCode == 200 else { return Observable.error(NewsAppError.apiError) }
                guard let dict = data as? [String: Any] else { return Observable.error(NewsAppError.unknown) }
                    
                guard let responseData = dict["responseData"] as? Dictionary<String, AnyObject> else {return Observable.error(NewsAppError.unknown)}
                guard let feed = responseData["feed"] as? Dictionary<String, AnyObject> else {return Observable.error(NewsAppError.unknown)}
                guard let entries = feed["entries"] as? [AnyObject] else {return Observable.error(NewsAppError.unknown)}
                    
                
//                return entries.map { Entry(value: $0) }
                return Observable.just(entries.map { Entry(value: $0) })
                
        }
    
    }
}
