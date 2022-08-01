//
//  NewsLikeButton.swift
//  weatherVk
//
//  Created by Арина Соколова on 12.07.2022.
//

import UIKit

class NewsLikeButton: UIControl {

    @IBOutlet var likePost: UIImageView!
    var isLike: Bool = false
    
    override func awakeFromNib() {
        likePost.backgroundColor = .clear
        likePost.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
