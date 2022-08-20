//
//  InputPopupViewController.swift
//  RC_week2
//
//  Created by 소정의 Mac on 2022/08/20.
//

import UIKit

class InputPopupViewController: UIViewController {
    var add : String = ""
    @IBOutlet var addTextField: UITextField!
    @IBAction func okButton(_ sender: Any) {
        add = addTextField.text ?? ""
        let pickStoreViewController = PickStoreViewController()
        pickStoreViewController.inputAdd = add
        pickStoreViewController.modalPresentationStyle = .overCurrentContext
        self.present(pickStoreViewController, animated: true, completion: nil)
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
