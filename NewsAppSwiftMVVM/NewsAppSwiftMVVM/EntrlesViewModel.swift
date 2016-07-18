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
    
    //MARK: - Set up
    
    init() {
        //Initialise dependencies

    }
    
    func reloadData(title: String) {
        entries = EntryAPIService(entryStore: EntryStoreImpl()).fetchEntries(q: title)
    }
    

    
}
