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
    var numberOfViews: Int
    
    init(imageNews: UIImage? = nil, textNews: String, comments: [String], numberOfViews: Int) {
        self.imageNews = imageNews
        self.textNews = textNews
        self.comments = comments
        self.numberOfViews = numberOfViews
    }
}
