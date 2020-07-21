//
//  Logout.swift
//  MyShop
//
//  Created by Андрей Закусов on 21.07.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import Foundation
import Alamofire

class Logout: AbstractRequestFactory {
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

extension Logout: LogoutRequestFactory {
    func logout(userName: String, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void) {
        let requestModel = LogoutRequestModel(baseUrl: baseUrl, login: userName)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Logout {
    struct LogoutRequestModel: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "logout.json"
        
        let login: String
        var parameters: Parameters? {
            return [
                "username": login
            ]
        }
    }
}

