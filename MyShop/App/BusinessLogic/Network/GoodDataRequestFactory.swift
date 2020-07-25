//
//  GoodDataRequestFactory.swift
//  MyShop
//
//  Created by Андрей Закусов on 25.07.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import Foundation
import Alamofire

protocol GetGoodByIdDataRequestFactory {
    func getGoodById(id: String, completionHandler: @escaping (AFDataResponse<GetGoodByIdResult>) -> Void)
}
