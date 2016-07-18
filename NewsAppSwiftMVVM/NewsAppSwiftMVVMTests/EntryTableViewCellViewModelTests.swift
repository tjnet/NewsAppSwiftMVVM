//
//  TestEntryTableViewCellViewModel.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/06/05.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import XCTest


import RxSwift
import RxCocoa
@testable import NewsAppSwiftMVVM

class TestEntryTableViewCellViewModel: XCTestCase {

    let bag = DisposeBag()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInit() {
        let e = EntryTableViewCellViewModel(entry: Entry())
        XCTAssertNotNil(e)

        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    

}
