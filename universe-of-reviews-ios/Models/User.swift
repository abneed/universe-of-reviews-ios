//
//  User.swift
//  universe-of-reviews-ios
//
//  Created by Guillermo Abneed Rodriguez Velazquez on 6/7/19.
//  Copyright © 2019 Guillermo Abneed Rodriguez Velazquez. All rights reserved.
//

import Foundation

struct User: Decodable
{
    var id: Int?
    var first_name: String?
    var last_name: String?
    var birth_date: String?
    var weight: Int?
    var height: Int?
    var email: String?
    var password_digest: String?
    var image_url: String?
    var created_at: String?
    var updated_at: String?
}

var arrayUsers = [User]()
