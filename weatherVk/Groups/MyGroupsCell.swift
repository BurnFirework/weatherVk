//
//  MyGroupsCell.swift
//  weatherVk
//
//  Created by Арина Соколова on 14.05.2022.
//

import UIKit

class MyGroupsCell: UITableViewCell {

    @IBOutlet weak var myImageGroup: UIImageView!
    
    @IBOutlet weak var myNameGroup: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
