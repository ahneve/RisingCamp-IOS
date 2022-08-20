//
//  HomeViewController.swift
//  RC_week2
//
//  Created by 소정의 Mac on 2022/08/16.
//

import UIKit
import Foundation

class HomeViewController: UIViewController {

    
    @IBOutlet var subButton: UIButton!
    @IBAction func subButton(_ sender: Any) {
        let homeViewController = HomeSubViewController()
        homeViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(homeViewController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
