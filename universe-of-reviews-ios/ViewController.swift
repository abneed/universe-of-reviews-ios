//
//  ViewController.swift
//  universe-of-reviews-ios
//
//  Created by Guillermo Abneed Rodriguez Velazquez on 6/3/19.
//  Copyright © 2019 Guillermo Abneed Rodriguez Velazquez. All rights reserved.
//

import UIKit
//import SwiftyJSON

class ViewController: UIViewController {

   
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        GetReviews()
    }

    @IBOutlet weak var TableView: UITableView!
    
    func GetReviews(){
         let urlReviews = "https://universe-of-reviews.herokuapp.com/reviews.json"
        guard let url = URL(string: urlReviews) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request)
        {(data, response, error) in
            print(data)
            print(response)
    }
    
}
}/*
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
}*/

