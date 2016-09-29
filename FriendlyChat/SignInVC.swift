//
//  SignInVC.swift
//  FriendlyChat
//
//  Created by AW on 15/09/2016.
//  Copyright © 2016 goneToPlaid. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import SwiftKeychainWrapper

class SignInVC: UIViewController {
   
    @IBOutlet weak var usernameField: TextField!
    @IBOutlet weak var passwordField: TextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
           }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.defaultKeychainWrapper().stringForKey(KEY_UID) {
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }

    }

    @IBAction func FBLoginBtnPressed(_ sender: AnyObject) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("not able to login with facebok \(error)")
            } else if result?.isCancelled == true {
                print("user cancelled face book auth")
                
            } else {
                print("authenticated")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuthenticate(credential)
            }
        }
    }
    
    func firebaseAuthenticate(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Unable to Authenticate with Firebase \(error)")
            } else {
                print("succsefully authenticated with Firebase")
                if let user = user {
                    self.completeSignin(id: user.uid)
                    
                }
                }
        })
}
    

    @IBAction func loginBtnPressed(_ sender: AnyObject) {
        if let email = usernameField.text, let pwd = passwordField.text {
         FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
            if error == nil {
                print("DONE - authenticated with Firebase")
                self.completeSignin(id: (user?.uid)!)
                
            } else {
                FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                    if error != nil {
                        print ("unable to authenticate with Firebase")
                    } else {
                        print("sucessfully authenticated with Firebase")
                        self.completeSignin(id: (user?.uid)!)
                    }
                })
            }
         })
        }
        
    }
    func completeSignin(id: String) {
        let keychainResult = KeychainWrapper.defaultKeychainWrapper().setString(id, forKey: KEY_UID)
        print("data saved to keychain \(keychainResult)")
        performSegue(withIdentifier: "goToFeed", sender: nil)
    }

    
}
