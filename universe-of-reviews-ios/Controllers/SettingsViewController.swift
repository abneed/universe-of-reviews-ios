//
//  SettingsViewController.swift
//  universe-of-reviews-ios
//
//  Created by Guillermo Abneed Rodriguez Velazquez on 6/6/19.
//  Copyright © 2019 Guillermo Abneed Rodriguez Velazquez. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtBirthDate: UITextField!
    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var txtHeight: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtPasswordConfirmation: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureHandler))
        view.addGestureRecognizer(tapGesture)
        let user_id = Session.shared.getUserId()
        print(Session.shared.getUserId())
        let urlUserRequest = "https://universe-of-reviews.herokuapp.com/users/\(user_id)"
        guard let url = URL(string: urlUserRequest) else {return}
        var request = URLRequest(url: url)
        request.setValue(Session.shared.getJWT(), forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) //Esa clase se encarga de la invocaion.
        {(data, response, error) in
            DispatchQueue.main.async(execute: //La cola de procesos de la aplicacion.
                {
                    guard let datos = data else { return }
                    do
                    {
                        let user: User = try JSONDecoder().decode(User.self, from: datos)
                        print(user)
                        self.txtFirstName.text = user.first_name!
                        self.txtLastName.text = user.last_name!
                        self.txtBirthDate.text = user.birth_date!
                        self.txtWeight.text = String(user.weight!)
                        self.txtHeight.text = String(user.height!)
                        self.txtEmail.text = user.email!
                    }
                    catch let jsonError
                    {
                        print(jsonError)
                    }
            })
            }.resume()
    }
    
    @objc func tapGestureHandler() {
        txtFirstName.endEditing(true)
        txtLastName.endEditing(true)
        txtBirthDate.endEditing(true)
        txtWeight.endEditing(true)
        txtHeight.endEditing(true)
        txtEmail.endEditing(true)
        txtPassword.endEditing(true)
        txtPasswordConfirmation.endEditing(true)
    }
    
    @IBAction func btnSaveChanges(_ sender: Any) {
        
        //AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
        AudioServicesPlayAlertSound(SystemSoundID(1008))
        //GOOGLEAR SONIDOS DEFINIDOS.
        
        let user_id = Session.shared.getUserId()
        let first_name = txtFirstName.text!
        let last_name = txtLastName.text!
        let birth_date = txtBirthDate.text!
        let weight = txtWeight.text!
        let height = txtHeight.text!
        let email = txtEmail.text!
        let password = txtPassword.text!
        let password_confirmation = txtPasswordConfirmation.text!
        var params = "user[first_name]=\(first_name)&user[last_name]=\(last_name)&user[birth_date]=\(birth_date)&user[weight]=\(weight)&user[height]=\(height)&user[email]=\(email)"
        if (password != password_confirmation)  {
            return
        }
        else if (password != "" && password_confirmation != "") {
            params = "user[first_name]=\(first_name)&user[last_name]=\(last_name)&user[birth_date]=\(birth_date)&user[weight]=\(weight)&user[height]=\(height)&user[email]=\(email)&user[password]=\(password)&[password_confirmation]=\(password_confirmation)"
        }
        
        let urlUserPut = "https://universe-of-reviews.herokuapp.com/users/\(user_id)"
        let url = URL(string: urlUserPut)!
        var request = URLRequest(url: url)
        request.setValue(Session.shared.getJWT(), forHTTPHeaderField: "Authorization")
        request.httpMethod = "PATCH"
        request.httpBody = params.data(using: .utf8) //Texto plpano del parametro lo convierte a data con el formato utf8
        
        URLSession.shared.dataTask(with: request)
        {(data, response, error) in
            DispatchQueue.main.async
                {
                    print(data!)
                    print(response!)
                }
            }.resume()

    }
    
    @IBAction func btnSignOut(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "status")
        Session.shared.clear()
        Switcher.updateRootVC()
    }
}
