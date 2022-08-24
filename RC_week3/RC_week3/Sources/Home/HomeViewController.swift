//
//  HomeViewController.swift
//  RC_week3
//
//  Created by 소정의 Mac on 2022/08/23.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //NavigationBar에 이미지(로고) 넣기
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        logoImageView.contentMode = .scaleAspectFit
        let logoImage = #imageLiteral(resourceName: "logoImage.png")
        logoImageView.image = logoImage
        self.navigationItem.titleView = logoImageView
        
        //self.navigationItem.titleView?.frame.size.width = 10
        
        
    }


}
