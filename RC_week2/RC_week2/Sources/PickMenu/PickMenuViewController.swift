//
//  PickMenuViewController.swift
//  RC_week2
//
//  Created by 소정의 Mac on 2022/08/20.
//

import UIKit

class PickMenuViewController: UIViewController, UITableViewDelegate {

    var sandMenuName : [String] = ["머쉬룸", "스파이시 쉬림프", "스파이시 쉬림프 아보카도", "쉬림프", "터키 베이컨 아보카도", "로티세리 바비큐 치킨", "이탈리안 비엠티", "로스트 치킨", "에그마요", "k-바비큐", "풀드 포크 바비큐", "비엘티"]
    var sandMenuEngName : [String] = ["Musnroom", "Spicy Shrimp", "Spicy Shrimp Avocado", "Shrimp", "Turkey Bacon Abocado", "Rotisserie Barbecue Chiken", "Italian B.M.T", "Roasted Chicken", "Egg Mayo", "K-BBQ", "Pulled Pork Barbecue", "B.L.T"]
    var saladMenuName : [String] = ["머쉬룸", "스파이시 쉬림프", "스파이시 쉬림프 아보카도"]
    var saladMenuEngName : [String] = ["Musnroom", "Spicy Shrimp", "Spicy Shrimp Avocado"]
                         
    @IBOutlet var seg: UISegmentedControl!
    @IBAction func seg(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 2 {
            viewState = 1
            tableView.reloadData()
        } else if sender.selectedSegmentIndex == 3{
            viewState = 2
            
            tableView.reloadData()
        }
    }
    @IBOutlet var tableView: UITableView!
    
    var viewState : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "PickMenuTableViewCell", bundle: nil), forCellReuseIdentifier: "PickMenuTableViewCell")
        
        
        // Do any additional setup after loading the view.
    }

}

extension PickMenuViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var countRow : Int = 0
        if viewState == 1 {
            countRow = sandMenuName.count
        } else if viewState == 2 {
            countRow = saladMenuName.count
        }
        return countRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PickMenuTableViewCell", for: indexPath) as! PickMenuTableViewCell

        
        if viewState == 1 {
            for i in 0...saladMenuName.count {
                cell.menuName.text = sandMenuName[indexPath.row]
                cell.menuEngName.text = sandMenuEngName[indexPath.row]
                cell.menuImage.image = #imageLiteral(resourceName: "스크린샷 2022-08-20 오전 4.14.48.png")
            }
        } else if viewState == 2 {
            for i in 0...saladMenuName.count {
                cell.menuName.text = saladMenuName[indexPath.row]
                cell.menuEngName.text = saladMenuEngName[indexPath.row]
                cell.menuImage.image = #imageLiteral(resourceName: "스크린샷 2022-08-20 오전 4.55.27.png")
        }
    }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCell = tableView.cellForRow(at: indexPath)
        
        let pickMenuViewController = PickMenuViewController()
        pickMenuViewController.modalPresentationStyle = .overCurrentContext
        self.present(pickMenuViewController, animated: true, completion: nil)
    }
    
    
    }

