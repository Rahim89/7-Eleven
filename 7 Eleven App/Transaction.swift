//
//  Transaction.swift
//  7 Eleven App
//
//  Created by MyMac on 3/14/19.
//  Copyright © 2019 Abdourahim Diallo. All rights reserved.
//

import Foundation

struct Transaction: Decodable {
    var id: Int
    var name: String
    var username: String
    var email: String
    
    
////    enum codingKeys: String, CodingKey {
////        case name = "name"
////        case username = "username"
////        case email = "email"
////    }
////    
//    // Initializer
//    init(id: Int, name: String, username: String, email: String) {
//        self.id = id
//        self.name = name
//        self.username = username
//        self.email = email
//    }
}

