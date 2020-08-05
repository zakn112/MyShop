//
//  Good.swift
//  MyShop
//
//  Created by Андрей Закусов on 25.07.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import Foundation
struct Good: Codable {
    let id: Int
    let name: String
    let price: Int
    let quantity: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price = "price"
        case quantity = "quantity"
    }
}
