//
//  PostPresenterTest.swift
//  postViperAppTests
//
//  Created by Memo Figueredo on 28/3/22.
//

import XCTest
@testable import postViperApp

class PostPresenterTest: XCTestCase {
    
    var sut: PostsPresenter?
    let interactor = MockInteractorInput()
    let router = MockPostRouter(view: PostsViewController())
    let view = MockPostsPresenterOutput()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = PostsPresenter()
        sut?.getPostsInteractor = interactor
        interactor.presenter = sut
        sut?.router = router
        sut?.view = view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut?.getPostsInteractor = nil
        interactor.presenter = nil
        sut?.router = nil
        sut?.view = nil
        sut = nil
    }


    func testGetPost_ShouldFindOnePost() {
        sut?.getPost()
        XCTAssertTrue(interactor.calls.didExecute)
        XCTAssertEqual(sut?.posts.count, 1)
    }
    
    func testGotoDetailGivenPost_ShouldCallNextView() {
//        Arrange
        let post = Post(userId: 1, id: 1, title: "", description: "")
        let navController = UINavigationController()
        
//        Act
        sut?.goToDetail(post: post, view: navController)
        
//        Assert
        XCTAssertTrue(router.calls.didPresentDetailPost)
        
    }

}
