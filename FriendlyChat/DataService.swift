//
//  DataService.swift
//  FriendlyChat
//
//  Created by AW on 30/09/2016.
//  Copyright © 2016 goneToPlaid. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = FIRDatabase.database().reference()
    


class DataService {
    
    static let ds = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child("Posts")
    private var _REF_USERS = DB_BASE.child("users")
    
    
    var REF_BASE : FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_POSTS: FIRDatabaseReference {
        return _REF_POSTS
        
    }
    
    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }
    
    func createFirbaseDBUser(uid: String, userData: Dictionary<String, String>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    func getPosts(Caption: String, imageURL: String, Likes: Int){
        REF_POSTS
    }
        
    }
    

