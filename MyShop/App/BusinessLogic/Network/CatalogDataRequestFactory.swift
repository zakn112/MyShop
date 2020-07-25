//
//  CatalogDataRequestFactory.swift
//  MyShop
//
//  Created by Андрей Закусов on 25.07.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import Foundation
import Alamofire

protocol CatalogDataRequestFactory {
    func catalogData(completionHandler: @escaping (AFDataResponse<[Good]>) -> Void)
}
