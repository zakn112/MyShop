//
//  CatalogDataResult.swift
//  MyShop
//
//  Created by Андрей Закусов on 25.07.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import Foundation
struct CatalogDataResult: Codable {
    let items: [Good]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
}
