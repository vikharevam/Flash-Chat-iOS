//
//  ChatViewController.swift
//  Flash Chat iOS
//
//  Created by Александр Вихарев on 29.05.2023.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    
    
    @IBOutlet weak var tebleView: UITableView!
    
    
    @IBOutlet weak var messageTextField: UITextField!
        
        

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func logOutButtonPresset(_ sender: UIBarButtonItem) {
        
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
}


