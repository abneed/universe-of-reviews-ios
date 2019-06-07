//
//  Session.swift
//  universe-of-reviews-ios
//
//  Created by Guillermo Abneed Rodriguez Velazquez on 6/6/19.
//  Copyright © 2019 Guillermo Abneed Rodriguez Velazquez. All rights reserved.
//

import Foundation

class Session {
    
    static let shared = Session()
    
    var user_id: Int?
    var json_web_token: String?
    
    private init(){}
    
    func setUserId(_ user_id: Int) {
        self.user_id = user_id
    }
    
    func getUserId() -> Int {
        return self.user_id!
    }
    
    func setJWT(_ json_web_token: String) {
        self.json_web_token = json_web_token
    }
    
    func getJWT() -> String {
        return self.json_web_token!
    }
    
    func clear() {
        self.user_id = nil
        self.json_web_token = nil
    }
}
