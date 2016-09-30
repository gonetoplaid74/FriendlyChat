//
//  FeedVC.swift
//  FriendlyChat
//
//  Created by AW on 29/09/2016.
//  Copyright © 2016 goneToPlaid. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        DataService.ds.REF_POSTS.observe(.value, with: { (snapshot) in

           // if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                print(snapshot.value)
//                for snap in snapshot{
//                    print("snap \(snap)")
//                    if let postDict = snap.value as? Dictionary<String, AnyObject> {
//                        let key = snap.key
//                        let post = Post(postKey: key, postData: postDict)
//                        self.posts.append(post)
                
                  //  }
                    
         //   }
         //   }
        })
    
    
          
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        
    }
    
    
   
    @IBAction func logout(_ sender: AnyObject) {
        
       let keychainResult = KeychainWrapper.defaultKeychainWrapper().removeObjectForKey(KEY_UID)
        
        print("ID removed from keychain \(keychainResult)")
        
        
        try! FIRAuth.auth()?.signOut()
        
    }
}
