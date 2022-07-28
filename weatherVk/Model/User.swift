//
//  User.swift
//  weatherVk
//
//  Created by Арина Соколова on 13.05.2022.
//

import Foundation
import UIKit

class User {
    
    let avatar: UIImage
    let nameFriend: String
    let photos: [UIImage]
    
    init(avatarFriend: UIImage, nameFriend: String, photos: [UIImage]) {
        self.avatar = avatarFriend
        self.nameFriend = nameFriend
        self.photos = photos
    }
}
