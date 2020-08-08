//
//  UserInfoViewController.swift
//  MyShop
//
//  Created by Андрей Закусов on 08.08.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
    var currentUser: User!

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userIDTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let currentUser = currentUser {
            userNameTextField.text = currentUser.login
            userIDTextField.text = String(currentUser.id)
            nameTextField.text = currentUser.name
            lastNameTextField.text = currentUser.lastname
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
