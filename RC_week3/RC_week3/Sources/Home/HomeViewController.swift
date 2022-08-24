//
//  HomeViewController.swift
//  RC_week3
//
//  Created by 소정의 Mac on 2022/08/23.
//

import UIKit

class HomeViewController: UIViewController {


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
    }

    
    //Home Dummy Data
    private let homeData : [Contents] = [
        Contents(title: "제철 황금향으로 전하는 향긋한 마음", contents: "여름부터 맛보는 만감류, 제주 황금향. 재배부터 산지 배송까지 제주 농협이 전 과정 관리합니다. 당도를 기준으로 선별한 황금향으로 다가오는 명절 감사의 마음을 전하세요. 🧑‍🌾 애써 키운 농수산물이 제값을 다하도록, 제가버치가 농어민과 함께합니다.", buy: 1722, like: 1236, userLike: false, state: 1),
        Contents(title: "곶자왈 속 신세계, 제주신화월드", contents: "아름다운 제주에서 보내는 2박 패키지. 리조트에 머무는 동안 10만 원 상당의 식음료 크레딧으로 골라서 식사하세요. 여기에 제철 재료로 만든 조식과 제주 인기 관광지 입장권도 포함합니다. 워터파크, 테마파크, 쇼핑몰 등 다양한 시설도 바로 연결되죠.", buy: 295, like: 1373, userLike: false, state: 1),
        Contents(title: "염원을 담은 민화 순금박 카드", contents: "조선민화박물관과 카카오메이커스의 합작. 부엉이, 감성모란도, 연화도. 각기 다른 길상의 의미를 담은 3가지 민화를 0.03g의 순금 카드에 새겼죠. 좋은 기운이 늘 곁에 머물도록 지갑에 넣어 간직하세요.", buy: 604, like: 478, userLike: false, state: 1),
        Contents(title: "귀한 1+ 등급 강원 한우 3종", contents: "강원도 산기슭에서 나고 자란 한우를 담은 추석 선물 세트. 신선한 불고기용, 국거리용, 장조림용을 각 300g씩 포장했습니다. 철저하게 관리받은 프리미엄 제품으로 정성스러운 마음을 전하세요. 🧑‍🌾 애써 키운 농수산물이 제값을 다하도록 제가버치가치가 농어민과 함께합니다.", buy: 1131, like: 1142, userLike: false, state:1),
        Contents(title: "태양열로부터 두피를 지키는 방법", contents: "장시간 라운딩으로 열 오른 두피와 모발엔 TS 골프 샴푸를. 식물성 특허 성분이 두피 온도를 낮추며 손상된 머리카락을 개선합니다. 탈모 증상 완화 기능까지 겸비했죠. 실외 스포츠를 즐긴다면 더 적합한 선택.", buy: 36, like: 129, userLike: false, state: 2),
        //매진된 아이템
        Contents(title: "자연이 낳은 푸른 달걀", contents:"병아리 때부터 정성스레 키운 청계. 넓고 쾌적한 스마트팜에서 18가지 발효 곡물과 12가지 산야초를 먹고 자라 건강한 알을 낳죠. 당일 산란해 영양 가득한 난각번호 1번 유정란을 안전하게 보내드립니다.", buy: 0, like: 2373, userLike: false, state: 0),
        Contents(title: "갓 수확한 나주 배로 감사의 마음을", contents: "맑은 물과 비옥한 땅을 지닌 나주에서 갓 수확한 배 선물 세트. 한입 깨물면 달콤하고 시원한 과즙이 넘치죠. 제초제와 화학비료를 사용하지 않고 깨끗하게 길렀습니다. 명절을 맞이해 제수용으로 실한 원물을 보내드려요. 🧑‍🌾 애써 키운 농수산물이 제값을 다하도록, 제가버치가 농어민과 함께합니다.", buy: 799, like: 635, userLike: false, state: 2),
        Contents(title: "용대리 황태로 명절 준비", contents: "강원도 인제의 추운 바람과 햇볕 속에서 수십번 얼었다 녹으며 포슬포슬한 황금빛으로 변신. 최적의 조건으로 꾸린 시설에서 자연 건조한 38~40cm의 황태 10마리를 5봉으로 구성해 보내드립니다. 🧑‍🌾 애써 키운 농수산물이 제값을 다하도록, 제가버치가 농어민과 함께합니다", buy: 2260, like: 1053, userLike: false, state: 0),
        Contents(title: "벌꿀인데 크리미해", contents: "은은한 단맛이 매력적인 국내산 아카시아 꿀을 고소하게 맛보세요. 자연숙성을 통해 얻어지는 귀한 꿀의 결정만을 모아 부드럽게 농축한 크림타입의 꿀 3종입니다. 경북 예천산 참깨, 들깨, 흑임자 3가지 재료와 꿀을 특허 기술로 섞었습니다. 진한 고소함과 적당한 달콤함이 입맛을 당기죠. 빵에 발라먹는 잼이나 샐러드드레싱 등의 소스로 활용합니다.", buy: 9, like: 44, userLike: false, state: 1),
        Contents(title: "활전복과 함께 감사 인사를 전하세요", contents: "전복 양식으로 손꼽히는 깨끗한 완도 해역에서 정성껏 길렀습니다. 거센 물살에서 질 좋은 다시마와 미역을 먹고 자라 살이 두툼하고 쫄깃합니다. 그럼에도 과잉 생산과 판로 감소 등으로어려움을 겪는 어촌을 위해 제가버치 프로젝트로 준비했죠. 신선함을 유지하는 산소팩에 담아 안전하게 직배송합니다. 바로 썰어서 회로, 풍미 있는 버터구이로, 내장과 함께 전복죽 등으로 활용해보세요. 약 17~18미를 선별해 1kg씩 보내드립니다.", buy: 329, like: 403, userLike: false, state: 0),
        Contents(title: "함평 미니 단호박, 출하 시작", contents: "높은 기온 차와 비옥한 토질에서 정성스레 키운 전라남도 함평의 미니 단호박. 한 달여간 후숙 기간을 거쳐 속이 노랗고, 수분과 당도가 높아 달콤합니다. 함평 농민의 정성이 식탁에 전해지도록 제가버치가 나섭니다. 꼼꼼하게 세척하고 선별해 5kg씩 농장에서 바로 보내드립니다. 달콤하고 칼로리가 낮은 단호박을 부드러운 수프부터 솥밥, 샐러드 등 다양한 요리에 활용해 보세요.", buy: 641, like: 415, userLike: false, state: 2)
    ]

}


extension HomeViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        return cell
    }
    
    
    
}

