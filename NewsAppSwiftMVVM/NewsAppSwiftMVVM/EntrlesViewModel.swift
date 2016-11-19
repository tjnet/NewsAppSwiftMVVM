//
//  EntryViewModel.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/06/28.
//  Copyright © 2016年 edu.self. All rights reserved.
//


import RxSwift
import RxCocoa

final class EntriesViewModel {
    
    //MARK: - Dependecies
    
    //MARK: - Model
    
//    var entries: Driver<[Entry]> = Driver.never()
    var entries: Observable<[Entry]> = Observable.never()
    
    
    let service: EntryAPIService
    
    //MARK: - Set up
    
    init(service: EntryAPIService) {
        //Initialise dependencies
        self.service = service
    }
    
    func reloadData(title: String) {
        entries = self.service.fetchEntries(query: title)
    }
    
    
    

    
}
