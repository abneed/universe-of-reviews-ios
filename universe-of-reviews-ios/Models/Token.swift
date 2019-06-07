//
//  Token.swift
//  universe-of-reviews-ios
//
//  Created by Guillermo Abneed Rodriguez Velazquez on 6/7/19.
//  Copyright © 2019 Guillermo Abneed Rodriguez Velazquez. All rights reserved.
//

import Foundation

struct Token: Decodable {
    var auth_token: String?
    var user_id: Int?
}
