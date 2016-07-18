//
//  TestEntry.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/05/25.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import XCTest


@testable import NewsAppSwiftMVVM

class TestEntry: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit() {
        let e = Entry()
        XCTAssertNotNil(e)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
