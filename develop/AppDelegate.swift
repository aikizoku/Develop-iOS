//
//  AppDelegate.swift
//  develop
//
//  Created by yukithehero on 2018/11/02.
//  Copyright © 2018 aikizoku. All rights reserved.
//

import UIKit
import XCGLogger
import RxSwift
import Firebase
import UserNotifications

let log: XCGLogger? = {
    #if DEBUG
        let log = XCGLogger.default
        log.setup(level: .verbose, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: nil, fileLevel: .debug)
        return log
    #else
        return nil
    #endif
}()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static let shared: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // View
    var window: UIWindow?

    // 起動時に呼ばれる
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return handle(application: application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    /// タスクキルした時に呼ばれる
    func applicationWillTerminate(_ application: UIApplication) {
        handleWillTerminate(application: application)
    }
    
    /// バックグラウンドになる直前に呼ばれる
    func applicationWillResignActive(_ application: UIApplication) {
        handleWillResignActive(application: application)
    }
    
    /// バックグラウンドになった時に呼ばれる
    func applicationDidEnterBackground(_ application: UIApplication) {
        handleDidEnterBackground(application: application)
    }
    
    /// フォアグラウンドになる直前に呼ばれる
    func applicationWillEnterForeground(_ application: UIApplication) {
        handleWillEnterForeground(application: application)
    }
    
    /// フォアグラウンドになった時に呼ばれる
    func applicationDidBecomeActive(_ application: UIApplication) {
        handleDidBecomeActive(application: application)
    }
    
    // リモートプッシュ通知受診時に呼ばれる
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        handle(application: application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler)
    }
    
    /// プッシュ通知登録が成功した時に呼ばれる
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        handle(application: application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }
    
    /// プッシュ通知登録が失敗した時に呼ばれる
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        handle(application: application, didFailToRegisterForRemoteNotificationsWithError: error)
    }
    
    /// URLSchemeが実行された時に呼ばれる
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return handle(app: app, open: url, options: options)
    }
}

extension AppDelegate {
    
    fileprivate func handle(application: UIApplication,
                            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        UserNotificationManager.shared.setup(application: application)
        
        return true
    }
    
    fileprivate func handleWillTerminate(application: UIApplication) {
    }
    
    fileprivate func handleWillResignActive(application: UIApplication) {
    }
    
    fileprivate func handleDidEnterBackground(application: UIApplication) {
    }
    
    fileprivate func handleWillEnterForeground(application: UIApplication) {
    }
    
    fileprivate func handleDidBecomeActive(application: UIApplication) {
    }
    
    fileprivate func handle(application: UIApplication,
                            didReceiveRemoteNotification userInfo: [AnyHashable : Any],
                            fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    }
    
    fileprivate func handle(application: UIApplication,
                            didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        UserNotificationManager.shared.setDeviceToken(deviceToken)
    }
    
    fileprivate func handle(application: UIApplication,
                            didFailToRegisterForRemoteNotificationsWithError error: Error) {
    }
    
    fileprivate func handle(application: UIApplication,
                            didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
    }
    
    fileprivate func handle(app: UIApplication,
                            open url: URL,
                            options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return true
    }
}
