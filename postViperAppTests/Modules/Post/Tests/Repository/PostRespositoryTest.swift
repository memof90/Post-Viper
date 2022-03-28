//
//  PostRespositoryTest.swift
//  postViperAppTests
//
//  Created by Memo Figueredo on 28/3/22.
//

import XCTest
@testable import postViperApp

class PostRespositoryTest: XCTestCase {
    
    var sut: PostRepository?
    var remoteDataSource = MockPostService()
    var interactor = MockPostsRepositoryOutput()
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = PostRepository()
        sut?.interactor = interactor
        sut?.remoteDataSource = remoteDataSource
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut?.remoteDataSource = nil
        sut?.interactor = nil
        sut = nil
    }

    func testGetPost_WhenResolveResponse() {
        sut?.getPost()
        
        XCTAssertTrue(interactor.calls.didRetrievePosts)
    }


}
