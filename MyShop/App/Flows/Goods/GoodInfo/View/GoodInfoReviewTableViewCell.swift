//
//  GoodInfoReviewTableViewCell.swift
//  MyShop
//
//  Created by Андрей Закусов on 15.08.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import UIKit

class GoodInfoReviewTableViewCell: UITableViewCell {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
