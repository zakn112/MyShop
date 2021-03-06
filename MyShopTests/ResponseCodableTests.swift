//
//  ResponseCodableTests.swift
//  MyShopTests
//
//  Created by Андрей Закусов on 25.07.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import XCTest
import Alamofire
@testable import MyShop

class ResponseCodableTests: XCTestCase {
    
    var errorParser: ErrorParserStub!
    var requestFactory: RequestFactory!


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        errorParser = ErrorParserStub()
        requestFactory = RequestFactory()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        errorParser = nil
        requestFactory = nil

    }
    
    func testLogin() {
        let expectation = XCTestExpectation(description: "login")
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: "geekbrains", password: "123") { response in
            switch response.result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testLogout(){
        let expectation = XCTestExpectation(description: "logout")
        let logout = requestFactory.makeLogoutRequestFatory()
        logout.logout(userName: "Somebody") { response in
            switch response.result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testRegisterUser(){
        let expectation = XCTestExpectation(description: "registerUser")
        let auth = requestFactory.makeRegisterUserRequestFatory()
        auth.registerUser(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testChangeUserData(){
        let expectation = XCTestExpectation(description: "changeUserData")
        let changeUserData = requestFactory.makeChangeUserDataRequestFatory()
        changeUserData.changeUserData(userName: "Somebody", password: "mypassword", name: "firstname", lastname: "lastname") { response in
            switch response.result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetGoodById(){
        let expectation = XCTestExpectation(description: "getGoodById")
        let good = requestFactory.makeGoodDataRequestFactory()
        good.getGoodById(id: 123) { response in
            switch response.result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testCatalogData(){
        let expectation = XCTestExpectation(description: "catalogData")
        let catalog = requestFactory.makeCatalogDataRequestFactory()
        catalog.catalogData() { response in
            switch response.result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testAddReview(){
        let expectation = XCTestExpectation(description: "addReview")
        let review = requestFactory.makeReviewDataRequestFactory()
        review.addReview(userID: 1, comment: "some comment") { response in
            switch response.result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testApproveReview(){
        let expectation = XCTestExpectation(description: "approveReview")
        let review = requestFactory.makeReviewDataRequestFactory()
        review.approveReview(commentID: 1) { response in
            switch response.result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testRemoveReview(){
        let expectation = XCTestExpectation(description: "removeReview")
        let review = requestFactory.makeReviewDataRequestFactory()
        review.removeReview(commentID: 1) { response in
            switch response.result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetGoodReviewsById(){
        let expectation = XCTestExpectation(description: "getGoodReviewsById")
        let review = requestFactory.makeReviewDataRequestFactory()
        review.getGoodReviewsById(goodID: 123) { response in
            switch response.result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testAddToBasket(){
        let expectation = XCTestExpectation(description: "addToBasket")
        let review = requestFactory.makeBasketDataRequestFactory()
        review.addToBasket(goodID: 1) { response in
            switch response.result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testDeleteFromBasket(){
        let expectation = XCTestExpectation(description: "deleteFromBasket")
        let review = requestFactory.makeBasketDataRequestFactory()
        review.deleteFromBasket(goodID: 1) { response in
            switch response.result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetBasket(){
        let expectation = XCTestExpectation(description: "getBasket")
        let review = requestFactory.makeBasketDataRequestFactory()
        review.getBasket() { response in
            switch response.result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

}


struct PostStub: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

enum ApiErrorStub: Error {
    case fatalError
}

struct ErrorParserStub: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return ApiErrorStub.fatalError
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}
