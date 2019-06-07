//
//  PostReviewController.swift
//  universe-of-reviews-ios
//
//  Created by Guillermo Abneed Rodriguez Velazquez on 6/6/19.
//  Copyright © 2019 Guillermo Abneed Rodriguez Velazquez. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

class PostReviewController: UIViewController {
    
    @IBOutlet weak var txtMovieTitle: UITextField!
    @IBOutlet weak var txtContent: UITextField!
    @IBOutlet weak var txtDirectors: UITextField!
    @IBOutlet weak var txtGenre: UITextField!
    @IBOutlet weak var txtActors: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtDateOfRelease: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureHandler))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func tapGestureHandler() {
        txtMovieTitle.endEditing(true)
        txtContent.endEditing(true)
        txtDirectors.endEditing(true)
        txtGenre.endEditing(true)
        txtActors.endEditing(true)
        txtCountry.endEditing(true)
        txtDateOfRelease.endEditing(true)
    }
    
    @IBAction func btnPublishReview(_ sender: Any) {
        let user_id = Session.shared.getUserId()
        let movie_title = txtMovieTitle.text!
        let content = txtContent.text!
        let directors = txtDirectors.text!
        let genre = txtGenre.text!
        let actors = txtActors.text!
        let country = txtCountry.text!
        let date_of_release = txtDateOfRelease.text!
        
        let urlAuthenticate = "https://universe-of-reviews.herokuapp.com/reviews"
        let params = "review[content]=\(content)&review[movie_title]=\(movie_title)&review[actors]=\(actors)&review[directors]=\(directors)&review[genre]=\(genre)&review[country_production]=\(country)&review[date_of_release]=\(date_of_release)&review[user_id]=\(user_id)"
        
        guard let url = URL(string: urlAuthenticate) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = params.data(using: .utf8)
        request.setValue(Session.shared.getJWT(), forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request)
        {(data, response, error) in
            DispatchQueue.main.async
            {
                AudioServicesPlayAlertSound(SystemSoundID(1008))
            }
            }.resume()
        
        
    }
}
