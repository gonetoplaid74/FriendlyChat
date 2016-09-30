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
                    let userData = ["provider": credential.provider]

                    self.completeSignin(id: user.uid, userData: userData)
                    
                }
                }
        })
}
    @IBAction func loginBtnPressed(_ sender: AnyObject) {
        if let email = usernameField.text, let pwd = passwordField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("JESS: Email user authenticated with Firebase")
                    if let user = user {
                        let userData = ["provider": user.providerID]
                        self.completeSignin(id: user.uid, userData: userData)
                    }
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("JESS: Unable to authenticate with Firebase using email")
                        } else {
                            print("JESS: Successfully authenticated with Firebase")
                            if let user = user {
                                let userData = ["provider": user.providerID]
                                self.completeSignin(id: user.uid, userData: userData)
                            }
                        }
                    })
                }
            })
        }
    }


//    @IBAction func loginBtnPressed(_ sender: AnyObject) {
//        if let email = usernameField.text, let pwd = passwordField.text {
//         FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
//            if error == nil {
//                print("DONE - authenticated with Firebase")
//                self.completeSignin(id: (user?.uid)!)
//                
//            } else {
//                FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
//                    if error != nil {
//                        print ("unable to authenticate with Firebase")
//                    } else {
//                        print("sucessfully authenticated with Firebase")
//                        let userData = ["provider": user?.providerID]
//                        self.completeSignin(id: user.uid, userData: userData)
//                        
//                    }
//                })
//            }
//         })
//        }
//        
//    }
    func completeSignin(id: String, userData: Dictionary<String, String>) {
        
        DataService.ds.createFirbaseDBUser(uid: id, userData: userData)
        
        let keychainResult = KeychainWrapper.defaultKeychainWrapper().setString(id, forKey: KEY_UID)
        print("data saved to keychain \(keychainResult)")
        performSegue(withIdentifier: "goToFeed", sender: nil)
    }

    
}
