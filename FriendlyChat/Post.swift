//
//  Post.swift
//  FriendlyChat
//
//  Created by AW on 30/09/2016.
//  Copyright © 2016 goneToPlaid. All rights reserved.
//

import Foundation
import Firebase


class Post{
    
    private var _caption: String!
    private var _imageURL: String!
    private var _likes: Int!
    private var _postID: String!
    private var _postReference: FIRDatabaseReference!
    
    
    var caption: String {
        return _caption
    }
    
    var imageURL: String {
        return _imageURL
    }
    var likes: Int {
        return _likes
    }
    var postID: String {
        return _postID
    }
    
    init(caption: String, imageURL: String, likes: Int) {
        
    self._caption = caption
    self._imageURL = imageURL
    self._likes = likes
    
        
    }
    init(postID: String, postData: Dictionary<String, AnyObject>) {
        self._postID = postID
        
        if let caption = postData["Caption"] as? String {
            self._caption = caption
        }
        
        if let imageURL = postData["imageURL"] as? String {
            self._imageURL = imageURL
        }
        
        if let likes = postData["Likes"] as? Int {
            self._likes = likes
            
        }
        
        _postReference = DataService.ds.REF_POSTS.child(_postID)
        
    }
    func adjustLikes(addLikes: Bool) {
        if addLikes {
            _likes = _likes + 1
        } else {
            _likes = _likes - 1
        }
        _postReference.child("Likes").setValue(likes)
        
    }
    
    
    
}
