//
//  ListEntriesUI.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/11/09.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import Foundation
import RxSwift

protocol ListEntriesUI: BaseUI {
    func showEntries(entries: [Entry])
}
