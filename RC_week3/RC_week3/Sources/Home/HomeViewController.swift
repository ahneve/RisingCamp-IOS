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
    var imageArr : [UIImage] = [#imageLiteral(resourceName: "homecell_hanlla.jpeg"), #imageLiteral(resourceName: "homecell_gozz.jpeg"), #imageLiteral(resourceName: "homecell_gold.jpeg"), #imageLiteral(resourceName: "homecell_meat.jpeg"), #imageLiteral(resourceName: "homecell_hair.jpeg"),#imageLiteral(resourceName: "homecell_egg.jpeg") ,#imageLiteral(resourceName: "homecell_pear.jpeg") ,#imageLiteral(resourceName: "homecell_fish.jpeg") ,#imageLiteral(resourceName: "homecell_honey.jpeg") , #imageLiteral(resourceName: "homecell_abalone.jpeg"), #imageLiteral(resourceName: "homecell_pumpkin.jpeg")]
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
        //tableView.estimatedRowHeight = 300
        //tableView.rowHeight = UITableView.automaticDimension
    
        


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


extension HomeViewController : UITableViewDataSource, UITableViewDelegate, HomeTableViewCellDelegate {

    func likeButtonAction(cell: HomeTableViewCell) {
        //버튼 누른 cell의 인덱스 구하기
        var indexPath = tableView.indexPath(for: cell)?[1]
        print(indexPath ?? 0, "번째")
        //해당 셀의 좋아요 상태 파악
        let realm = try! Realm()
        var data = Array(realm.objects(HomeContent.self))
        //userLike: true or false로 반환됨
        var currentLikeState = data[indexPath ?? 0].userLike
        //like: 현재 좋아요 수로 반환됨
        var currentLikeCount = data[indexPath ?? 0].like
        
        
        if(currentLikeState == false) {
            //update
            
            let symbolConfig = UIImage.SymbolConfiguration(scale: .small)
            cell.likeButton.setImage(UIImage(systemName: "heart.fill", withConfiguration: symbolConfig), for: .normal)
            
        } else {
            let symbolConfig = UIImage.SymbolConfiguration(scale: .small)
            cell.likeButton.setImage(UIImage(systemName: "heart", withConfiguration: symbolConfig), for: .normal)
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.titleLabel.text = homeContent[indexPath.row].title
        cell.contentsLabel.text = homeContent[indexPath.row].content
        cell.buyLabel.text = String(homeContent[indexPath.row].buy)
        cell.likeButton.setTitle(String(homeContent[indexPath.row].like), for: .normal)
        cell.itemImageView.image = imageArr[indexPath.row]
        
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
        
}


