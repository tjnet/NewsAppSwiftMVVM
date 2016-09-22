//
//  TestFeedManager.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/05/25.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa

@testable import NewsAppSwiftMVVM

class EntryAPIServiceTests: XCTestCase {
    
    private let bag = DisposeBag()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit() {
        let e = EntryAPIService(entryStore: EntryStoreMock())
        XCTAssertNotNil(e)
    }
    
    func testFetchEntries() {
        let expectation = expectationWithDescription("subscribeNext called")
        let e = EntryAPIService(entryStore: EntryStoreMock())
        
        let expectedArticle = Entry()
        expectedArticle.setValuesForKeysWithDictionary(
            ["title": "title1", "link": "https://example.com/articles/1", "contentSnippet": "今日はとてもいい天気..."]
        )
        
        e.fetchEntries(query: "ios").driveNext({ (articles) in
            XCTAssertNotNil(articles)
            XCTAssertFalse(articles.isEmpty)
            XCTAssertEqual(articles.first, expectedArticle)
            expectation.fulfill()
        }).addDisposableTo(bag)
        
        waitForExpectationsWithTimeout(5, handler: { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            } 
        })
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
    
}
