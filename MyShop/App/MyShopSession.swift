//
//  MyShopSession.swift
//  MyShop
//
//  Created by Андрей Закусов on 11.08.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import Foundation

class MyShopSession {
    static let shared: MyShopSession = MyShopSession()
    var currentUser: User?
    
    private init() {
        
    }
}
