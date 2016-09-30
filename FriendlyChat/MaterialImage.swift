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
        layer.cornerRadius = 6.0
        clipsToBounds = true
        layer.shadowColor = UIColor(red: SHADOW_COLOUR, green: SHADOW_COLOUR, blue: SHADOW_COLOUR, alpha: 0.7).cgColor
        layer.shadowOpacity = 0.9
        layer.shadowRadius = 4.0
        layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        


}
}
