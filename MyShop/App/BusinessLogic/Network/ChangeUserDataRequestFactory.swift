//
//  ChangeUserDataRequestFactory.swift
//  MyShop
//
//  Created by Андрей Закусов on 21.07.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import Foundation

import Alamofire

protocol ChangeUserDataRequestFactory {
    func changeUserData(userName: String, password: String, name: String, lastname: String, completionHandler: @escaping (AFDataResponse<ChangeUserDataResult>) -> Void)
}
