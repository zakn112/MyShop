//
//  Basket.swift
//  MyShop
//
//  Created by Андрей Закусов on 05.08.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import Foundation
import Alamofire

class Basket: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "http://127.0.0.1:8080/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Basket: BasketDataRequestFactory {
    
    func addToBasket(goodID: Int, completionHandler: @escaping (AFDataResponse<AddToBasketDataResult>) -> Void) {
        let requestModel = AddToBasketRequestModel(baseUrl: baseUrl, goodID: goodID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func deleteFromBasket(goodID: Int, completionHandler: @escaping (AFDataResponse<DeleteFromBasketDataResult>) -> Void) {
        let requestModel = DeleteFromBasketRequestModel(baseUrl: baseUrl, goodID: goodID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func getBasket(completionHandler: @escaping (AFDataResponse<GetBasketDataResult>) -> Void) {
        let requestModel = GetBasketRequestModel(baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
}

extension Basket {
    struct AddToBasketRequestModel: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "addToBasket"
        
        let goodID: Int
        var parameters: Parameters? {
            return [
                "goodID": goodID
            ]
        }
    }
    
    struct DeleteFromBasketRequestModel: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "deleteFromBasket"
        
        let goodID: Int
        var parameters: Parameters? {
            return [
                "goodID": goodID
            ]
        }
    }
    
    struct GetBasketRequestModel: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getBasket"
        
        var parameters: Parameters? {
            return nil
        }
    }
}
