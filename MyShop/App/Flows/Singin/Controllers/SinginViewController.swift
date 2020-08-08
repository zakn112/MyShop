//
//  SinginViewController.swift
//  MyShop
//
//  Created by Андрей Закусов on 08.08.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import UIKit

class SinginViewController: UIViewController {
    var requestFactory: RequestFactory!

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestFactory = RequestFactory()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func singinPressButton(_ sender: Any) {
        
        guard let userName = usernameTextField.text, let userPassword = passwordTextField.text,
            userName != "", userPassword != ""
            else {
            let alert = UIAlertController(title: "Error", message: "You must fill in your username and password", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            return
        }

        
        let auth = requestFactory.makeRegisterUserRequestFatory()
        auth.registerUser(userName: userName, password: userPassword) { response in
            switch response.result {
            case .success(_):
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: "Registration was completed successfully", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                    
                }
            case .failure(_):
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: "Registration is not complete", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
        }
        
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
