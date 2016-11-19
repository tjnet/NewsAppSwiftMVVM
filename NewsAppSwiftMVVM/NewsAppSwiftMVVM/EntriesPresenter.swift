//
//  EntriesPresenter.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/11/09.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import Foundation
import RxSwift

class EntriesPresenter: BasePresenter {
    
    private let ui: ListEntriesUI
    private let entryStore: EntryStore
    private let entryWireframe: EntryWireframe
    private let title: String
    
    init(ui: ListEntriesUI,
         entryStore: EntryStore = EntryStoreImpl(),
         entryWireframe: EntryWireframe = EntryWireframe(),
         title: String = "top"
        ){
        self.ui = ui
        self.entryStore = entryStore
        self.entryWireframe = entryWireframe
        self.title = title
    }

    func viewDidLoad() {
        showEntries()
    }
    
    private func showEntries(){
        entryStore.fetchEntries(query: self.title).subscribe(onNext: { entries in
            self.ui.showEntries(entries: entries)
        }).addDisposableTo(bag)
    }
}
