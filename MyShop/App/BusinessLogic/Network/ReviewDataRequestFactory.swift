//
//  ReviewDataRequestFactory.swift
//  MyShop
//
//  Created by Андрей Закусов on 01.08.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import Foundation
import Alamofire

protocol ReviewDataRequestFactory {
    func addReview(userID: Int, comment: String, completionHandler: @escaping (AFDataResponse<AddReviewDataResult>) -> Void)
    
    func approveReview(commentID: Int, completionHandler: @escaping (AFDataResponse<ApproveReviewDataResult>) -> Void)
    
    func removeReview(commentID: Int, completionHandler: @escaping (AFDataResponse<RemoveReviewDataResult>) -> Void)
    
}
