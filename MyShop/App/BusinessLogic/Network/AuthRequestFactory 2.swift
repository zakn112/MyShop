//
//  AuthRequestFactory.swift
//  MyShop
//
//  Created by Андрей Закусов on 21.07.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import Foundation

import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}
