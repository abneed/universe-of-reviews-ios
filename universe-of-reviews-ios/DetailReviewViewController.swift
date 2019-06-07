//
//  DetailReviewViewController.swift
//  universe-of-reviews-ios
//
//  Created by Sistemas on 6/6/19.
//  Copyright © 2019 Guillermo Abneed Rodriguez Velazquez. All rights reserved.
//

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
