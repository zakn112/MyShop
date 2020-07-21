//
//  LogoutRequestFactory.swift
//  MyShop
//
//  Created by Андрей Закусов on 21.07.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import Foundation

import Alamofire

protocol LogoutRequestFactory {
    func logout(userName: String, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
}
