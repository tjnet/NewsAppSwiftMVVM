//
//  EntryViewModel.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/06/28.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class EntriesViewModel {
    
    //MARK: - Dependecies
    
    //MARK: - Model
    
    var entries: Driver<[Entry]>
    
    //MARK: - Set up
    
    init(_ title: String) {
        //Initialise dependencies
        entries = EntryAPIService().fetchEntries(q: title)
    }

    
}
