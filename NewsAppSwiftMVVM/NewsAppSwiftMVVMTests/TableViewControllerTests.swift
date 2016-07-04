//
//  TableViewControllerTests.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/07/04.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import XCTest

@testable import NewsAppSwiftMVVM


struct TestEntriesLoader {
    func loadEntries() -> [Entry] {
        
        var entriesArray = [Entry]()
        
        for i in [1,2,3] {
            let e = Entry()
            e.title = "title\(i)"
            e.link = "link\(i)"
            e.contentSnippet = "contentSnippet\(i)"
            entriesArray.append(e)
        }
        return entriesArray
    }
}

class TableViewControllerTests: XCTestCase {
    
    var viewController: TableViewController!
    
    private var tableView: UITableView {
        return viewController.tableView
    }

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewController = TableViewController(nibName: "TableViewController", title: "top")
        viewController.entryList = TestEntriesLoader().loadEntries()
        let _ = viewController.view
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Identifier")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testEntryList() {
        XCTAssert(viewController.entryList.count > 0)
    }
}
