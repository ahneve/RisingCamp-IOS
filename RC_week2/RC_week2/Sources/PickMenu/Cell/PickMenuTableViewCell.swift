//
//  PickMenuTableViewCell.swift
//  RC_week2
//
//  Created by 소정의 Mac on 2022/08/20.
//

import UIKit

class PickMenuTableViewCell: UITableViewCell {
    @IBOutlet var menuName: UILabel!
    @IBOutlet var menuEngName: UILabel!
    
    @IBOutlet var menuImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
