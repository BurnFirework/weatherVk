//
//  ProfileViewCell.swift
//  weatherVk
//
//  Created by Арина Соколова on 14.05.2022.
//

import UIKit

class ProfileViewCell: UICollectionViewCell {
    @IBOutlet weak var nameFriend: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet var counter: UILabel!
    @IBOutlet var likeButton: LikeButton!
    @IBOutlet var container: UIView!
    
    override func awakeFromNib() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.numberOfTapsRequired = 2
        container.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_: UITapGestureRecognizer) {
        likeButton.isLike.toggle() //меняем true на false и наоборот
        
        if likeButton.isLike {
            likeButton.likePicture.image = UIImage(systemName: "suit.heart.fill")
            counter.text = "1"
        } else {
            likeButton.likePicture.image = UIImage(systemName: "suit.heart")
            counter.text = "0"
        }
    }
    
}
