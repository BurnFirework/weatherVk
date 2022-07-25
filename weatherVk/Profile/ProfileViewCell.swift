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
            UIView.animate(withDuration: 0.2, animations: { () -> Void in
                self.counter.transform = .init(scaleX: 1.25, y: 1.25)
            }) { (finished: Bool) -> Void in
                self.counter.text = "1"
                self.likeButton.likePicture.image = UIImage(systemName: "suit.heart.fill")
                UIView.animate(withDuration: 0.25, animations: { () -> Void in
                    self.counter.transform = .identity
                })
            }
        } else {
            UIView.animate(withDuration: 0.2, animations: { () -> Void in
                self.counter.transform = .init(scaleX: 1.25, y: 1.25)
            }) { (finished: Bool) -> Void in
                self.counter.text = "0"
                self.likeButton.likePicture.image = UIImage(systemName: "suit.heart")
                UIView.animate(withDuration: 0.25, animations: { () -> Void in
                    self.counter.transform = .identity
                })
            }
        }
    }
    
}
