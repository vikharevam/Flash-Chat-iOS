//
//  WelcomeViewController.swift
//  Flash Chat iOS
//
//  Created by Александр Вихарев on 29.05.2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = ""
    
        let text = K.appName
        var charIndex = 0.0
        
        for letter in text {
            Timer.scheduledTimer(withTimeInterval: charIndex * 0.1, repeats: false) { Timer in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
            
        }
        
        let array = [registerButton, loginButton]
        
        
        
        array.forEach {
            $0?.backgroundColor = .systemBlue
            $0?.tintColor = .white
            $0?.layer.cornerRadius = 10
        
        }
        
        
    
        
    }
 
    @IBAction func registerPassed(_ sender: UIButton) {
    }
    @IBAction func loginPassed(_ sender: UIButton) {
    }
}
