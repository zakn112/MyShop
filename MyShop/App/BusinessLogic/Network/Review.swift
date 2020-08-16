//
//  Review.swift
//  MyShop
//
//  Created by Андрей Закусов on 01.08.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import Foundation
import Alamofire

class Review: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "http://127.0.0.1:8080/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Review: ReviewDataRequestFactory {
    func addReview(userID: Int, comment: String, completionHandler: @escaping (AFDataResponse<AddReviewDataResult>) -> Void) {
        let requestModel = AddReviewRequestModel(baseUrl: baseUrl, userID: userID, comment: comment)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func approveReview(commentID: Int, completionHandler: @escaping (AFDataResponse<ApproveReviewDataResult>) -> Void) {
        let requestModel = ApproveReviewRequestModel(baseUrl: baseUrl, commentID: commentID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func removeReview(commentID: Int, completionHandler: @escaping (AFDataResponse<RemoveReviewDataResult>) -> Void) {
        let requestModel = RemoveReviewRequestModel(baseUrl: baseUrl, commentID: commentID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func getGoodReviewsById(goodID: Int, completionHandler: @escaping (AFDataResponse<[UserReview]>) -> Void) {
        let requestModel = GetGoodReviewsByIdRequestModel(baseUrl: baseUrl, goodID: goodID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
}

extension Review {
    struct AddReviewRequestModel: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "addReview"
        
        let userID: Int
        let comment: String
        var parameters: Parameters? {
            return [
                "userID": userID,
                "comment": comment
            ]
        }
    }
    
    struct ApproveReviewRequestModel: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "approveReview"
        
        let commentID: Int
        var parameters: Parameters? {
            return [
                "commentID": commentID
            ]
        }
    }
    
    struct RemoveReviewRequestModel: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "removeReview"
        
        let commentID: Int
        var parameters: Parameters? {
            return [
                "commentID": commentID
            ]
        }
    }
    
    struct GetGoodReviewsByIdRequestModel: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getGoodReviewsById/{goodID}"
        
        let goodID: Int
        var parameters: Parameters? {
            return [
                "goodID": goodID
            ]
        }
    }
}
