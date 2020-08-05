//
//  BasketDataResult.swift
//  MyShop
//
//  Created by Андрей Закусов on 05.08.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import Foundation

struct AddToBasketDataResult: Codable {
    let result: Int
}

struct DeleteFromBasketDataResult: Codable {
    let result: Int
}

struct GetBasketDataResult: Codable {
    let amount: Int
    let countGoods: Int
    let contents: [Good]
}
