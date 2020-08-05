//
//  BasketDataRequestFactory.swift
//  MyShop
//
//  Created by Андрей Закусов on 05.08.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import Foundation
import Alamofire

protocol BasketDataRequestFactory {
    func addToBasket(goodID: Int, completionHandler: @escaping (AFDataResponse<AddToBasketDataResult>) -> Void)
    
    func deleteFromBasket(goodID: Int, completionHandler: @escaping (AFDataResponse<DeleteFromBasketDataResult>) -> Void)
    
    func getBasket(completionHandler: @escaping (AFDataResponse<GetBasketDataResult>) -> Void)
    
}
