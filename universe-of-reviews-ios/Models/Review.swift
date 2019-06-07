//
//  Review.swift
//  universe-of-reviews-ios
//
//  Created by Guillermo Abneed Rodriguez Velazquez on 6/7/19.
//  Copyright © 2019 Guillermo Abneed Rodriguez Velazquez. All rights reserved.
//

import Foundation

struct Review: Decodable
{
    var id: Int?
    var content: String?
    var movie_title: String?
    var actors: String?
    var directors: String?
    var genre: String?
    var country_production: String?
    var date_of_release: String?
    var user_id: Int?
    var created_at: String?
    var updated_at: String?
}

var arrayReviews = [Review]()
