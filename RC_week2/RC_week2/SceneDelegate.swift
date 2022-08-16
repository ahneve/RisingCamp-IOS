//
//  SceneDelegate.swift
//  RC_week2
//
//  Created by 소정의 Mac on 2022/08/16.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        
        //0-2. 로컬 알림
        UNUserNotificationCenter.current().getNotificationSettings() {
            settings in
            if settings.authorizationStatus == UNAuthorizationStatus.authorized {
                //사용자의 동의를 받았을 때 알람 메시지를 보낼 로컬 알림 객체 생성
                let nContents = UNMutableNotificationContent()
                //배지 설정
                nContents.badge = 1
                nContents.title = "타이틀"
                nContents.subtitle = "서브타이틀"
                nContents.body = "바디"
                //사운드 설정
                nContents.sound = UNNotificationSound.default
                nContents.userInfo = ["name":"ahneve"]
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                let request = UNNotificationRequest(identifier: "aheveIosTest", content: nContents, trigger: trigger)
                
                //알림 발송을 담당하는 센터에 추가
                UNUserNotificationCenter.current().add(request)
            }
        }
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

