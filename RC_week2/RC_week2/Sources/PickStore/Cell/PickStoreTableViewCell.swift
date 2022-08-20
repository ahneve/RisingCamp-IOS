//
//  PickStoreTableViewCell.swift
//  RC_week2
//
//  Created by 소정의 Mac on 2022/08/20.
//

import UIKit

class PickStoreTableViewCell: UITableViewCell {

    
    @IBAction func menuButton(_ sender: Any) {
        /*
        let pickMenuViewController = PickMenuViewController()
        pickMenuViewController.modalPresentationStyle = .overCurrentContext
        self.present(pickMenuViewController, animated: true, completion: nil)
         */
         
    }
         
    @IBOutlet var storeAdd: UILabel!
    @IBOutlet var storeName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
