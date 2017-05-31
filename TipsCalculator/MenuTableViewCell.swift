//
//  MenuTableViewCell.swift
//  TipsCalculator
//
//  Created by Lon on 5/29/17.
//  Copyright © 2017 Lon. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var ImgIcon: UIImageView!
    @IBOutlet weak var lbMenuName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
