//
//  MaterialView.swift
//  FriendlyChat
//
//  Created by AW on 15/09/2016.
//  Copyright © 2016 goneToPlaid. All rights reserved.
//



import UIKit

class MaterialView: UIView {
    
    override func awakeFromNib() {
        layer.cornerRadius = 8.0
        layer.shadowColor = UIColor(red: SHADOW_COLOUR, green: SHADOW_COLOUR, blue: SHADOW_COLOUR, alpha: 0.5).cgColor
        layer.shadowOpacity = 0.9
        layer.shadowRadius = 12.0
        layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        
        
    }
    
}
