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
    
    @IBOutlet weak var counterViews: UILabel!
    
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
            UIView.animate(withDuration: 0.2, animations: { () -> Void in
                self.counter.transform = .init(scaleX: 1.25, y: 1.25)
            }) { (finished: Bool) -> Void in
                self.counter.text = "1"
                self.newsLike.likePost.image = UIImage(systemName: "suit.heart.fill")
                UIView.animate(withDuration: 0.25, animations: { () -> Void in
                    self.counter.transform = .identity
                })
            }
        } else {
            UIView.animate(withDuration: 0.2, animations: { () -> Void in
                self.counter.transform = .init(scaleX: 1.25, y: 1.25)
            }) { (finished: Bool) -> Void in
                self.counter.text = "0"
                self.newsLike.likePost.image = UIImage(systemName: "suit.heart")
                UIView.animate(withDuration: 0.25, animations: { () -> Void in
                    self.counter.transform = .identity
                })
            }
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
