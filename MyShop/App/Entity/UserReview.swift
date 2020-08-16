//
//  UserReview.swift
//  MyShop
//
//  Created by Андрей Закусов on 15.08.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import Foundation

struct UserReview: Codable {
    let userID: Int
    let userName: String
    let massege: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case userName = "user_name"
        case massege = "user_message"
    }
}
