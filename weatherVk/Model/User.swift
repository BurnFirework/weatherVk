//
//  User.swift
//  weatherVk
//
//  Created by Арина Соколова on 13.05.2022.
//

import Foundation
import UIKit

class User {
    
    let avatar: UIImage?
    let nameFriend: String
    
    init(avatarFriend: UIImage? = nil, nameFriend: String) {
        self.avatar = avatarFriend
        self.nameFriend = nameFriend
    }
}
