//
//  Group.swift
//  weatherVk
//
//  Created by Арина Соколова on 14.05.2022.
//

import Foundation
import UIKit

class Group {
    
    let photo: UIImage?
    let nameGroup: String
    
    init(photoGroup: UIImage? = nil, nameGroup: String) {
        self.photo = photoGroup
        self.nameGroup = nameGroup
    }
}
