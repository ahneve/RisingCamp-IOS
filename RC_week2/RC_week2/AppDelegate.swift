//
//  AppDelegate.swift
//  RC_week2
//
//  Created by 소정의 Mac on 2022/08/16.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //0-1. LaunchScreen 5초간 지연
        sleep(5)
        
        //0-2. '써브웨이'에서 알림을 보내고자 합니다. 로컬 알림
        if #available(iOS 10.0, *) {
            let notiCenter = UNUserNotificationCenter.current()
            //'경고, 사운드 및 아이콘 배지'가 알림에 포함될 수 있음
            notiCenter.requestAuthorization(options: [.alert, .badge, .sound]){
                (didAllow, e) in
            }
        }
        else {//iOS 버전이 10.0 이하일 때
            }
            return true
        }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

