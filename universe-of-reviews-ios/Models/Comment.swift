//
//  Comment.swift
//  universe-of-reviews-ios
//
//  Created by Guillermo Abneed Rodriguez Velazquez on 6/7/19.
//  Copyright © 2019 Guillermo Abneed Rodriguez Velazquez. All rights reserved.
//

import Foundation

struct Comment: Decodable
{
    var id: Int?
    var content: String?
    var user_id: Int?
    var review_id: Int?
    var created_at: String?
    var updated_at: String?
}

var arrayComments = [Comment]()
