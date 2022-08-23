//
//  BaseViewController.swift
//  RC_week3
//
//  Created by 소정의 Mac on 2022/08/20.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            self.setNavigationBar()
        }
    

    @objc func selectorX() { }
      
    func setNavigationBar() {
        let width = self.view.frame.width
        let height = UIApplication.shared.statusBarFrame.size.height
                 (navigationController?.navigationBar.frame.height ?? 0.0)
        let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y:44, width: width, height: 44))
        self.view.addSubview(navigationBar)
        let navigationItem = UINavigationItem(title: "Navigation bar")
        let doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(selectorX))
        navigationItem.rightBarButtonItem = doneBtn
        navigationBar.setItems([navigationItem], animated: false)
           
        }
    
    @objc func dissmissView(){
        self.dismiss(animated: true, completion: nil)
        
    }
    
    

}

