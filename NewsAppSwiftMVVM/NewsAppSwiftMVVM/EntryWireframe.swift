//
//  EntryWireFrame.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/11/16.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import Foundation
import UIKit

class EntryWireframe {
    
    struct identifiers {
        static let sb = "EntriesCollectionViewController"
        static let list = String(describing: EntriesCollectionViewController.self)
    }
    
    private var storyboard: UIStoryboard { return UIStoryboard(name: identifiers.sb, bundle: nil) }
    
    func list() -> UIViewController {
        guard let vc = storyboard.instantiateViewController(withIdentifier: identifiers.list) as? EntriesCollectionViewController else { fatalError() }
        vc.presenter = EntriesPresenter(ui: vc, entryStore: EntryStoreImpl(), title: vc.title!)
        return UINavigationController(rootViewController: vc)
    }
    
}
