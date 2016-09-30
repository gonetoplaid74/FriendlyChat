//
//  MaterialImage.swift
//  FriendlyChat
//
//  Created by AW on 30/09/2016.
//  Copyright © 2016 goneToPlaid. All rights reserved.
//

import UIKit

class MaterialImage: UIImageView {
    
    override func awakeFromNib() {
        layer.cornerRadius = 25.0
        clipsToBounds = true
//        layer.shadowColor = UIColor(red: SHADOW_COLOUR, green: SHADOW_COLOUR, blue: SHADOW_COLOUR, alpha: 0.7).cgColor
//        layer.shadowOpacity = 1.0
//        layer.shadowRadius = 10
//        layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        


}
}
