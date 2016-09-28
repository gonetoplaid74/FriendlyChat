//
//  bottomView.swift
//  FriendlyChat
//
//  Created by AW on 26/09/2016.
//  Copyright © 2016 goneToPlaid. All rights reserved.
//

import UIKit

class BottomView: UIView {
    
    override func awakeFromNib() {
                layer.shadowColor = UIColor(red: SHADOW_COLOUR, green: SHADOW_COLOUR, blue: SHADOW_COLOUR, alpha: 0.5).cgColor
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 0, height: -2)

}
}
