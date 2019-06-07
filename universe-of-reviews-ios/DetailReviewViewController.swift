//
//  DetailReviewViewController.swift
//  universe-of-reviews-ios
//
//  Created by Sistemas on 6/6/19.
//  Copyright © 2019 Guillermo Abneed Rodriguez Velazquez. All rights reserved.
//

import Foundation
import UIKit

class DetailReviewViewController: UIViewController {

    @IBOutlet weak var txtFechaEstreno: UILabel!
    @IBOutlet weak var txtNombrePelicula: UILabel!
    @IBOutlet weak var txtActores: UILabel!
    @IBOutlet weak var txtDirector: UILabel!
    @IBOutlet weak var txtGenero: UILabel!
    @IBOutlet weak var txtPais: UILabel!
    @IBOutlet weak var txtResena: UILabel!
    @IBOutlet weak var tvComentarios: UITableView!
    var reviews = [ReviewClass]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadReviewDetail();
        // Do any additional setup after loading the view.
    }
    
    func loadReviewDetail(){
        //let id = 3;
        let urlAuthenticate = URL(string: "https://universe-of-reviews.herokuapp.com/reviews/3")
        
        guard let downloadURL = urlAuthenticate else { return }
        
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                print("Algo salio mal")
                return
            }
            print("funciona")
            do{
                let decoder = JSONDecoder();
                let downloadReviews = try decoder.decode(Reviews.self, from: data);
                self.reviews = downloadReviews.reviews;
            }catch{
                print("algo salio mal");
            }
        }.resume()
//        let params = "review[content]=\(id)"
//        guard let url = URL(string: urlAuthenticate) else {return}
//
//        var request = URLRequest(url: url);
//        request.httpMethod = "GET";
//        request.httpBody = params.data(using: .utf8);
//        URLSession.shared.dataTask(with: request){(
//            data, response, error) in
//            DispatchQueue.main.async {
//                print(data!)
//                print(response!)
//                guard response != nil else {return}
//            }
//            }.resume();
    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
//        return reviews.count;
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        UITableViewCell{
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ComentsViewCell") as? ComentsViewCell else {return UITableViewCell()}
//
//        }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
