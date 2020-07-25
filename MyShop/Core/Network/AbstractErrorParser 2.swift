//
//  AbstractErrorParser.swift
//  MyShop
//
//  Created by Андрей Закусов on 21.07.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}

