//
//  NewsCellXib.swift
//  weatherVk
//
//  Created by Арина Соколова on 11.07.2022.
//

import UIKit

class NewsCellXib: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsLabel: UILabel!
    
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var newsLike: NewsLikeButton!
    
    @IBOutlet weak var shareView: UIView!
    @IBOutlet weak var shareImage: UIImageView!
    
    override func awakeFromNib() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.numberOfTapsRequired = 2
        newsLike.addGestureRecognizer(tap)
        
        let tapShare = UITapGestureRecognizer(target: self, action: #selector(shareTap))
        tapShare.numberOfTapsRequired = 1
        shareView.addGestureRecognizer(tapShare)
    }
    
    @objc func handleTap(_: UITapGestureRecognizer) {
        newsLike.isLike.toggle() //меняем true на false и наоборот
        
        if newsLike.isLike {
            newsLike.likePost.image = UIImage(systemName: "suit.heart.fill")
            counter.text = "1"
        } else {
            newsLike.likePost.image = UIImage(systemName: "suit.heart")
            counter.text = "0"
        }
    }
    
    
    @objc func shareTap(_: UITapGestureRecognizer) {
        let pasteboard = UIPasteboard.general
        pasteboard.string = newsLabel.text
        shareImage.tintColor = .red
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.shareImage.tintColor = .gray
        }
    }
    
}
