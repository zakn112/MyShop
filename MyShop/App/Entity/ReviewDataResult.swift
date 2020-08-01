//
//  ReviewDataResult.swift
//  MyShop
//
//  Created by Андрей Закусов on 01.08.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import Foundation

struct AddReviewDataResult: Codable {
    let result: Int
    let userMessage: String
}

struct ApproveReviewDataResult: Codable {
    let result: Int
}

struct RemoveReviewDataResult: Codable {
    let result: Int
}
