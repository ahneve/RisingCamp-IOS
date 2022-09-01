//
//  ViewController.swift
//  RC_week4
//
//  Created by 소정의 Mac on 2022/08/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        DispatchQueue.global().async {
            for i in 0..<100{
                print(i)
            }
        }
        
        DispatchQueue.global().async {
            for i in 200..<300{
                print(i)
            }
        }
        
    }

    //

}

