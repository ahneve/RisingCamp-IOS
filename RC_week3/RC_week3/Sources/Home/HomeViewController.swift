//
//  HomeViewController.swift
//  RC_week3
//
//  Created by 소정의 Mac on 2022/08/23.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {

    var homeContent : [HomeContent] = []
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //NavigationBar에 이미지(로고) 넣기
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        logoImageView.contentMode = .scaleAspectFit
        let logoImage = #imageLiteral(resourceName: "logoImage.png")
        logoImageView.image = logoImage
        self.navigationItem.titleView = logoImageView
        
        //tableView 설정
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    
        //MARK: 데이터 Create
        //local default Realm 객체 열기
        let realm = try! Realm()
        //Realm 경로
        print("냥",Realm.Configuration.defaultConfiguration.fileURL!,"냥")
        /*
        try! realm.write{
            realm.add(makeHomeContents(5,"자연이 낳은 푸른 달걀", "병아리 때부터 정성스레 키운 청계. 넓고 쾌적한 스마트팜에서 18가지 발효 곡물과 12가지 산야초를 먹고 자라 건강한 알을 낳죠. 당일 산란해 영양 가득한 난각번호 1번 유정란을 안전하게 보내드립니다.", 0, 2373, false, 0))
            realm.add(makeHomeContents(6,"갓 수확한 나주 배로 감사의 마음을", "맑은 물과 비옥한 땅을 지닌 나주에서 갓 수확한 배 선물 세트. 한입 깨물면 달콤하고 시원한 과즙이 넘치죠. 제초제와 화학비료를 사용하지 않고 깨끗하게 길렀습니다. 명절을 맞이해 제수용으로 실한 원물을 보내드려요. 🧑‍🌾 애써 키운 농수산물이 제값을 다하도록, 제가버치가 농어민과 함께합니다.", 799, 635, false, 2))
        }
        */
        
        //MARK: 데이터 Read
        homeContent = Array(realm.objects(HomeContent.self))
        print(homeContent[10])
    }

    func makeHomeContents(_ id : Int, _ title:String, _ content:String, _ buy:Int, _ like:Int, _ userLike:Bool, _ state:Int) -> HomeContent {
        //홈 게시물 데이터 객체
        let homeContents = HomeContent()
        homeContents.id = id
        homeContents.title = title
        homeContents.content = content
        homeContents.buy = buy
        homeContents.like = like
        homeContents.userLike = userLike
        homeContents.state = state
        
        return homeContents
    }
}


extension HomeViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.titleLabel.text = homeContent[indexPath.row].title
        cell.contentsLabel.text = homeContent[indexPath.row].content
        return cell
    }
    
    
}


