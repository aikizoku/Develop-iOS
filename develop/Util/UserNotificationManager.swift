//
//  UserNotificationManager.swift
//  develop
//
//  Created by yukithehero on 2018/11/03.
//  Copyright © 2018 aikizoku. All rights reserved.
//

import Foundation
import RxSwift
import UserNotifications
import Firebase

final class UserNotificationManager: NSObject {
    
    static let shared = UserNotificationManager()
    
    let deviceTokenObserver = BehaviorSubject<String?>(value: nil)
    let fcmTokenObserver = BehaviorSubject<String?>(value: nil)
    
    private override init() {
        super.init()
    }
    
    func setup(application: UIApplication) {
        // APNsの設定
        UNUserNotificationCenter.current().delegate = self
        
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: options,
            completionHandler: {_, _ in })
        application.registerForRemoteNotifications()
        
        // FCMの設定
        Messaging.messaging().delegate = self
    }
    
    func setDeviceToken(_ token: Data) {
        let t = token.map({ String(format: "%.2hhx", $0) }).joined()
        deviceTokenObserver.onNext(t)
    }
}

extension UserNotificationManager: UNUserNotificationCenterDelegate {
    
}

extension UserNotificationManager: MessagingDelegate {
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        fcmTokenObserver.onNext(fcmToken)
    }
}
