//
//  Post.swift
//  FriendlyChat
//
//  Created by AW on 30/09/2016.
//  Copyright © 2016 goneToPlaid. All rights reserved.
//

import Foundation


class Post{
    
    private var _caption: String!
    private var _imageURL: String!
    private var _likes: Int!
    private var _postID: String!
    
    
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
        
        if let imageUrl = postData["imageURL"] as? String {
            self._imageURL = imageUrl
        }
        
        if let likes = postData["Likes"] as? Int {
            self._likes = likes
        }

        
    
    
    }
    
    
    
}
