//
//  RequestRouter.swift
//  MyShop
//
//  Created by Андрей Закусов on 21.07.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import Foundation
import Alamofire

enum RequestRouterEncoding {
    case url, json
}

protocol RequestRouter: URLRequestConvertible {
    var baseUrl: URL { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var fullUrl: URL { get }
    var encoding: RequestRouterEncoding { get }
}

extension RequestRouter {
    var fullUrl: URL {
        return baseUrl.appendingPathComponent(path)
    }
    
    var encoding: RequestRouterEncoding {
        return .url
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: fullUrl)
        urlRequest.httpMethod = method.rawValue
        
        switch self.encoding {
        case .url:
            urlRequest = try encode(urlRequest, with: parameters)
            return try URLEncoding.default.encode(urlRequest, with: parameters)
        case .json:
            return try JSONEncoding.default.encode(urlRequest, with: parameters)
        }
        
    }
    
    func encode(_ urlRequest: Alamofire.URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        guard let parameters = parameters else { return try urlRequest.asURLRequest() }
        var urlRequest = try urlRequest.asURLRequest()
        if var url = urlRequest.url?.absoluteString.removingPercentEncoding {
            for parameter in parameters {
                url = url.replacingOccurrences(of: "{\(parameter.key)}", with: "\(parameter.value)")
            }
            guard let url = URL(string: url) else { return try urlRequest.asURLRequest() }
            urlRequest.url = url
        }
        return urlRequest
    }
}
