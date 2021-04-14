//
//  SampleData.swift
//  TruyenTranh24hTests
//
//  Created by Huynh Tan Phu on 13/04/2021.
//

import XCTest
@testable import TruyenTranh24h

class SampleDataTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLoadStories() {
        // Load the stories successfuly
        SampleData.storyFilename = "stories"
        let stories = SampleData.stories()
        XCTAssertGreaterThan(stories.count, 0)
        
        // Cannot load stories from json file
        SampleData.storyFilename = "invalid file name"
        let stories1 = SampleData.stories()
        XCTAssertEqual(stories1.count, 0)
    
    }

}
