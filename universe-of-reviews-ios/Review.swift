//
//  Review.swift
//  universe-of-reviews-ios
//
//  Created by Sistemas on 6/7/19.
//  Copyright © 2019 Guillermo Abneed Rodriguez Velazquez. All rights reserved.
//

import UIKit

class Reviews: Codable{
    let reviews: [ReviewClass];
    
    init(reviews: [ReviewClass]) {
        self.reviews = reviews;
    }
}

class ReviewClass: Codable {
    let id: Int;
    let content:String;
    let movie_title: String
    let actors: String;
    let directors: String;
    let genre: String;
    let country_production: String;
    let date_of_release: Date;
    let user_id: Int;
    let created_at: Date;
    let updated_at: Date;
    let comments: [Comments];
    
    init(id: Int, content: String, movie_title: String, actors: String, directors: String, genre: String, country_production: String, date_of_release: Date, user_id: Int, created_at: Date, update_at: Date, comments: [Comments]) {
        self.id = id;
        self.content = content;
        self.movie_title = movie_title;
        self.actors = actors;
        self.directors = directors;
        self.genre = genre;
        self.country_production = country_production;
        self.date_of_release = date_of_release;
        self.user_id = user_id;
        self.created_at = created_at;
        self.updated_at = update_at;
        self.comments = comments;
        
    }
    
    class Comments: Codable{
        let id: Int;
        let content: String;
        let user_id: Int;
        let review_id: Int;
        let created_at: Date;
        let updated_at: Date;
        
        init(id: Int, content: String, user_id: Int, review_id: Int, created_at: Date, updated_at: Date) {
            self.id = id;
            self.content = content;
            self.user_id = user_id;
            self.review_id = review_id;
            self.created_at = created_at;
            self.updated_at = updated_at;
        }
    }
}
