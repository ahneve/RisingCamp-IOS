//
//  SceneDelegate.swift
//  RC_week3
//
//  Created by 소정의 Mac on 2022/08/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        //TabBarController에 띄워질 NavigationContoller
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        let searchViewController = UINavigationController(rootViewController: SearchViewController())
        let alertViewController = UINavigationController(rootViewController: AlertViewController())
        let userViewController = UINavigationController(rootViewController: UserViewController())
        
        //TabBarController 생성
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([homeViewController,searchViewController,alertViewController,userViewController], animated: true)
        
        //TabBarItem 설정
        if let items = tabBarController.tabBar.items {
            items[0].selectedImage = #imageLiteral(resourceName: "home_selected.png")
            items[0].selectedImage?.resizeImageTo(size: CGSize(width: 3, height: 3))
            items[0].image = #imageLiteral(resourceName: "home.png")
            items[0].title = "홈"
            
            items[1].selectedImage = #imageLiteral(resourceName: "search_selected.png")
            items[1].image = #imageLiteral(resourceName: "search_selected.png")
            items[1].title = "검색"
            
            items[2].selectedImage = #imageLiteral(resourceName: "bell_selected.png")
            items[2].image = #imageLiteral(resourceName: "bell.png")
            items[2].title = "알림"
            
            items[3].selectedImage = #imageLiteral(resourceName: "user_selected.png")
            items[3].image = #imageLiteral(resourceName: "user.png")
            items[3].title = "사용자"
        }
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}

extension UIImage {
    func resizeImageTo(size: CGSize) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return resizedImage
    }
}
