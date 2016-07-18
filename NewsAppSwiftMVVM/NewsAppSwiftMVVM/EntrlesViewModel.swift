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
    
    var entries: Driver<[Entry]> = Driver.never()
    
    internal var service: EntryAPIService?
    
    //MARK: - Set up
    
    init() {
        //Initialise dependencies

    }
    
    func reloadData(title: String) {
        entries = self.service!.fetchEntries(q: title)
    }
    
    func injectService(service: EntryAPIService) -> EntriesViewModel {
        self.service = service
        return self
    }
    
    

    
}
