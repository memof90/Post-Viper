//
//  PostViewControllerTest.swift
//  postViperAppTests
//
//  Created by Memo Figueredo on 28/3/22.
//

import XCTest
@testable import postViperApp

class PostViewControllerTest: XCTestCase {
    
    var sut: PostsViewController?
    let presenter = MockPostPresenterInput()

    override func setUpWithError() throws {
        sut = PostsViewController()
        sut?.presenter = presenter
        presenter.view = sut
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut?.presenter = nil
        presenter.view = nil
        sut = nil
    }

   
    func testValidateNameView_WhenViewRecive() {
        sut?.loadViewIfNeeded()
        XCTAssertEqual(sut?.title, "Post")
    }
    
    
    func testViewDidLoad_WhenEntryPoint() {
        sut?.loadViewIfNeeded()
        
        XCTAssertTrue(presenter.calls.didGetPost)
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
