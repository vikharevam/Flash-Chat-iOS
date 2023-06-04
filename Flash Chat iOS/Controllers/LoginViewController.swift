//
//  LoginViewController.swift
//  Flash Chat iOS
//
//  Created by Александр Вихарев on 29.05.2023.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class LoginViewController: UIViewController {
    
   
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBOutlet weak var loginButtonPassed: UIButton!
    
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
                } else {
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
    
}
