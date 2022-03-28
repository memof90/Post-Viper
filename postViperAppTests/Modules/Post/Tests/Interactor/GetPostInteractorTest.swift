//
//  GetPostInteractorTest.swift
//  postViperAppTests
//
//  Created by Memo Figueredo on 28/3/22.
//

import XCTest
@testable import postViperApp

class GetPostInteractorTest: XCTestCase {
    
    var sut: GetPostsInteractor?
    var repository = MockPotsRepositoryInput()
    var presenter = MockGetPostInteractorOutput()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = GetPostsInteractor()
        sut?.repository = repository
         repository.remoteDataSource = MockPostService()
         repository.interactor = sut
         sut?.presenter = presenter
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut?.repository = nil
        repository.interactor = nil
        sut?.presenter = nil
        sut = nil
    }

    func testGetPost_ShouldFindPost() {
//        arrange
        let expectation = self.expectation(description: "Fetching Movies")
//         act
        sut?.repository?.getPost()
        DispatchQueue.main.async {
            expectation.fulfill()
        }
//        assert
        XCTAssertTrue(repository.calls.didRetrievePosts)
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(presenter.calls.didRetrievePost)
        XCTAssertNotNil(repository.calls.post)
    }
    

}
