//
//  NYTimeMostViewedArticalsPresenterTest.swift
//  NYTimeMVPTests
//
//  Created by Upendra Nimmala on 09/11/18.
//  Copyright © 2018 Upendra Nimmala. All rights reserved.
//

import XCTest

class NYTimeMostViewedArticalsPresenterTest: XCTestCase {
    var presenter = NYTimeMostViewedArticalsPresenter()
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testNYTimeMostViewedArticalsSuccess() {
        presenter.getNYTimeMostViewedArticals()
        XCTAssertNotNil("should not be nil")
    }
    
}
