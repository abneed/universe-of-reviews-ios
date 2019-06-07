//
//  Datos.swift
//  universe-of-reviews-ios
//
//  Created by Guillermo Abneed Rodriguez Velazquez on 6/6/19.
//  Copyright © 2019 Guillermo Abneed Rodriguez Velazquez. All rights reserved.
//

import Foundation
import SwiftyJSON

struct User: Decodable
{
    var id: Int
    var first_name: String
    var last_name: String
    var birth_date: String
    var weight: Int
    var height: Int
    var email: String
    var password_digest: String
    var image_url: String
    var created_at: String
    var updated_at: String
}

var arrayUsers = [User]()

struct Review: Decodable
{
    var id: Int
    var content: String
    var movie_title: String
    var actors: String
    var directors: String
    var genre: String
    var country_production: String
    var date_of_release: String
    var user_id: Int
    var created_at: String
    var updated_at: String
    
    var arrayReviews = [Review]()
    
    init(json:JSON) {
        id = json["id"].int!
        content = json["content"].stringValue
        movie_title = json["movie_title"].stringValue
        actors = json["actors"].stringValue
        directors = json["directors"].stringValue
        genre = json["genre"].stringValue
        country_production = json["country_production"].stringValue
        date_of_release = json["date_of_release"].stringValue
        user_id = json["user_id"].int!
        created_at = json["created_at"].stringValue
        updated_at = json["updated_at"].stringValue
    }
}



struct Comment: Decodable
{
    var id: Int
    var content: String
    var user_id: Int
    var review_id: Int
    var created_at: String
    var updated_at: String
}

var arrayComments = [Comment]()
