//
//  GetGoodById.swift
//  MyShop
//
//  Created by Андрей Закусов on 25.07.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import Foundation
import Alamofire

class GetGoodById: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension GetGoodById: GetGoodByIdDataRequestFactory {
    func getGoodById(id: String, completionHandler: @escaping (AFDataResponse<GetGoodByIdResult>) -> Void) {
        let requestModel = GetGoodByIdDataRequestModel(baseUrl: baseUrl, id: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension GetGoodById {
    struct GetGoodByIdDataRequestModel: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getGoodById.json"
        
        let id: String
        var parameters: Parameters? {
            return [
                "id": id
            ]
        }
    }
}
