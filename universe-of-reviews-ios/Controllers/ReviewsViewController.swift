//
//  ReviewsViewController.swift
//  universe-of-reviews-ios
//
//  Created by Guillermo Abneed Rodriguez Velazquez on 6/6/19.
//  Copyright © 2019 Guillermo Abneed Rodriguez Velazquez. All rights reserved.
//

import Foundation
import UIKit

class ReviewsViewController:  UITableViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listReviews()
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(listReviews), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "Actualizando datos..")
        tableView.refreshControl = refreshControl
    }
    
    @objc func listReviews()
    {
        let liga = "https://universe-of-reviews.herokuapp.com/reviews"
        guard let url = URL(string: liga) else {return}
        URLSession.shared.dataTask(with: url)
        {(data, response, error) in
            DispatchQueue.main.async(execute:
                {
                    guard let datos = data else { return }
                    do
                    {
                        arrayReviews = try JSONDecoder().decode([Review].self, from: datos)
                        print(arrayReviews)
                    }
                    catch let jsonError
                    {
                        print(jsonError)
                    }
                    self.tableView.reloadData()
                    self.tableView.refreshControl?.endRefreshing()
            })
            }.resume()
    }

}
