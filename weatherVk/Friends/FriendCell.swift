//
//  FriendCell.swift
//  weatherVk
//
//  Created by Арина Соколова on 13.05.2022.
//

import UIKit

class FriendCell: UITableViewCell {

    @IBOutlet weak var friendsAvatarView: UIImageView!
    
    @IBOutlet weak var friendNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        friendsAvatarView.layer.cornerRadius = friendsAvatarView.bounds.width / 2
    }
    
    
}
