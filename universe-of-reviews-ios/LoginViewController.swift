//
//  LoginViewController.swift
//  universe-of-reviews-ios
//
//  Created by Guillermo Abneed Rodriguez Velazquez on 6/6/19.
//  Copyright © 2019 Guillermo Abneed Rodriguez Velazquez. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureHandler))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapGestureHandler() {
        txtEmail.endEditing(true)
        txtPassword.endEditing(true)
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        let email = txtEmail.text!
        let password = txtPassword.text!
        let urlAuthenticate = "https://universe-of-reviews.herokuapp.com/authenticate"
        let params = "email=\(email)&password=\(password)"
        
        guard let url = URL(string: urlAuthenticate) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = params.data(using: .utf8) //Texto plpano del parametro lo convierte a data con el formato utf8
        
        URLSession.shared.dataTask(with: request)
        {(data, response, error) in
            DispatchQueue.main.async
            {
                print(data!)
                print(response!)
                guard response != nil else { return }
                self.navigateToMainInterface()
            }
        }.resume()
    }
    
    private func navigateToMainInterface() {
        
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let mainNavigationVC = mainStoryBoard.instantiateViewController(withIdentifier: "MainNavigationController") as? MainNavigationController else {
            return
        }
        present(mainNavigationVC, animated: true, completion: nil)
    }
}
