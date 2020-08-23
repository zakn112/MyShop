//
//  LoginViewController.swift
//  MyShop
//
//  Created by Андрей Закусов on 08.08.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import UIKit
import FirebaseCrashlytics
import FirebaseAnalytics

class LoginViewController: UIViewController {
    
    var requestFactory: RequestFactory!
   
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
                MyShopSession.shared.currentUser = result.user
                DispatchQueue.main.async {
                   
                    let storyboard = UIStoryboard(name: "Goods", bundle: nil)
                    let homeViewController = storyboard.instantiateViewController(withIdentifier: "Goods")
                    UIApplication.shared.windows.first!.rootViewController = homeViewController
                  
                    Analytics.logEvent("Login_success", parameters: nil)
                }
            case .failure(_):
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: "Invalid username or password. Use user/123", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                    
                    Crashlytics.crashlytics().log("Invalid username or password.")
                    Analytics.logEvent("Invalid_username_password.", parameters: nil)
                }
            }
            
        }
    }
    
    @IBAction func singinPressButton(_ sender: Any) {
        Crashlytics.crashlytics().log("Sing in.Hello.")
        
    }
    
 
    

}
