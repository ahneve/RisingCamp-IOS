//
//  PickStoreViewController.swift
//  RC_week2
//
//  Created by 소정의 Mac on 2022/08/20.
//

import UIKit

class PickStoreViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var inputAddLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    var viewState : Int = 0
    var inputAdd : String = ""
    var index : [Int] = []
    var storeName : [String] = ["왕십리역", "포이사거리", "부산W스퀘어", "동덕여대", "울산옥동", "당산역", "광주상무", "송파역", "서산호수공원", "대구평리DT"]
    var storeAdd : [String] = ["서울특별시 성동구 왕십리로 328","서울특별시 강남구 논현로 84 1층","부산광역시 남구 분포로 145 1층 1055, 1056호 (용호동, 더블유)" , "서울특별시 성북구 화랑로13길 10", "울산광역시 남구 문수로 332", "서울특별시 영등포구 양평로 58", "광주광역시 서구 치평로 86" , "서울특별시 송파구 송파대로 374","충청남도 서산시 호수공원 12로 26" ,"대구 서구 서대구로 111 (평리동) 1층"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(inputAdd)
        inputAddLabel.text = inputAdd
        for i in 0...storeAdd.count-1 {
            if(storeAdd[i].contains(inputAdd)) {
                index.append(i)
            }
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "PickStoreTableViewCell", bundle: nil), forCellReuseIdentifier: "PickStoreTableViewCell")
        
    
    
    }

}

extension PickStoreViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return index.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PickStoreTableViewCell", for: indexPath) as! PickStoreTableViewCell

        for i in 0...index.count {
            cell.storeName.text = storeName[indexPath.row]
            cell.storeAdd.text = storeAdd[indexPath.row]
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
