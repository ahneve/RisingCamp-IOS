//
//  HomeTableViewCell.swift
//  RC_week3
//
//  Created by 소정의 Mac on 2022/08/24.
//

import UIKit
import RealmSwift

class HomeTableViewCell: UITableViewCell {
    
    weak var delegate : (HomeTableViewCellDelegate)?

    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentsLabel: UILabel!
    @IBOutlet var buyLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    
    @IBAction func likeButtonAction(_ sender: Any) {
        delegate?.likeButtonAction(cell: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentsLabel.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

protocol HomeTableViewCellDelegate: AnyObject {
    func likeButtonAction(cell: HomeTableViewCell)
}
