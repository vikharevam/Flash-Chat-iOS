//
//  RegisterViewController.swift
//  Flash Chat iOS
//
//  Created by Александр Вихарев on 29.05.2023.
//


import UIKit

import Firebase


class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    
    @IBOutlet weak var passwordTextfield: UITextField!
  

    
    @IBAction func registerButtonPassed(_ sender: UIButton) {
       
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                }
            }
        }
    }
    
    
}
