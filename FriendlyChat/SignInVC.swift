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

class SignInVC: UIViewController {
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
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
            }
        })
}

}
