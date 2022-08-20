//
//  HomeSubViewController.swift
//  RC_week2
//
//  Created by 소정의 Mac on 2022/08/20.
//

import UIKit

class HomeSubViewController: UIViewController {

    @IBOutlet var inputButton: UIButton!
    @IBAction func inputButton(_ sender: Any) {
            
        let inputPopupViewController = InputPopupViewController()
        inputPopupViewController.modalPresentationStyle = .overCurrentContext
        self.present(inputPopupViewController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputButton.layer.cornerRadius = 8
        inputButton.layer.borderWidth = 1
        inputButton.layer.borderColor = UIColor.lightGray.cgColor
        
    
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
