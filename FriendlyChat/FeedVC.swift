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

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

          }

   
    @IBAction func logout(_ sender: AnyObject) {
        
       let keychainResult = KeychainWrapper.defaultKeychainWrapper().removeObjectForKey(KEY_UID)
        
        print("ID remved from keychain \(keychainResult)")
        
        
        try! FIRAuth.auth()?.signOut()
        
    }
}
