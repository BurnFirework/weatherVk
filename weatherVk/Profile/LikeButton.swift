//
//  LikeButton.swift
//  weatherVk
//
//  Created by Арина Соколова on 03.07.2022.
//

import UIKit

class LikeButton: UIControl {

    @IBOutlet var likePicture: UIImageView!
    var isLike: Bool = false
    
    override func awakeFromNib() {
        likePicture.backgroundColor = .clear
        likePicture.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
