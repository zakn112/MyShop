//
//  LoginViewController.swift
//  MyShop
//
//  Created by Андрей Закусов on 08.08.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var requestFactory: RequestFactory!
    var currentUser: User!

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestFactory = RequestFactory()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginPressButton(_ sender: Any) {
        
        guard let userName = usernameTextField.text, let userPassword = passwordTextField.text,
            userName != "", userPassword != ""
            else {
            let alert = UIAlertController(title: "Error", message: "You must fill in your username and password", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            return
        }

        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: userName, password: userPassword) { response in
            switch response.result {
            case .success(let result):
                self.currentUser = result.user
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "loginUserInfo", sender: self)
                }
            case .failure(_):
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: "Invalid username or password. Use geekbrains/123", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
        }
    }
    
    @IBAction func singinPressButton(_ sender: Any) {
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "loginUserInfo", let controller = segue.destination as? UserInfoViewController {
            controller.currentUser = currentUser
        }
    }
    

}
