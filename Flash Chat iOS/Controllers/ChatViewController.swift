//
//  ChatViewController.swift
//  Flash Chat iOS
//
//  Created by Александр Вихарев on 29.05.2023.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = [
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        title = K.appName
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        loadMessage()
        
        
    }
    
    func loadMessage() {
        
        messages = []
        
        db.collection(K.FStore.collectionName).getDocuments { (querySnapshot, error) in
            if let e = error {
                print("There was an issue retrieving data from Firestore. \(e)")
            } else {
                if let snapshotDocements = querySnapshot?.documents {
                    for doc in snapshotDocements {
                        let data =  doc.data()
                        if let messageSender = data[K.FStore.senderField]  as?  String, let messageBody = data[K.FStore.bodyField] as? String {
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
        
    }
    
    
    @IBAction func logOutButtonPresset(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        var ref: DocumentReference? = nil
        if let messageBody = messageTextField.text, let messageSender = Auth.auth().currentUser?.email {
            ref = db.collection(K.FStore.collectionName).addDocument(data:[K.FStore.senderField:messageSender, K.FStore.bodyField:messageBody]){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
            
        }
    }
    
    
}
extension ChatViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return messages.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier ) as! MassageCell
            cell.label.text = messages[indexPath.row].body
            return cell
        }
    }
    
