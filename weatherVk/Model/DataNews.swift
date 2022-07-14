//
//  DataNews.swift
//  weatherVk
//
//  Created by Арина Соколова on 11.07.2022.
//

import Foundation
import UIKit

class DataNews {
    
    let imageNews: UIImage?
    let textNews: String
    var comments: [String]
    
    init(imageNews: UIImage? = nil, textNews: String, comments: [String]) {
        self.imageNews = imageNews
        self.textNews = textNews
        self.comments = comments
    }
}
