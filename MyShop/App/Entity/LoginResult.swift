//
//  LoginResult.swift
//  MyShop
//
//  Created by Андрей Закусов on 21.07.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import Foundation

struct LoginResult: Codable {
    let result: Int
    let user: User
}
