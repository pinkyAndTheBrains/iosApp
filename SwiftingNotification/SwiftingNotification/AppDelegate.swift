//
//  AppDelegate.swift
//  SwiftingNotification
//
//  Created by woroninb on 24/07/16.
//  Copyright © 2016 roche. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        let center = UNUserNotificationCenter.current()
        let action1 = UNNotificationAction(identifier: Action.espresso.rawValue, title: "Buy espresso", options: [.foreground])
        let action2 = UNNotificationAction(identifier: Action.cappucino.rawValue, title: "Buy cappucino", options: [.foreground])
        let action3 = UNNotificationAction(identifier: Action.latte.rawValue, title: "Buy latte", options: [.foreground])
        let category = UNNotificationCategory(identifier: Consts.customContentIdentifier, actions: [action1, action2, action3], intentIdentifiers: [])
        center.setNotificationCategories([category])
        center.requestAuthorization(options: [.alert]) { (greanted, error) in
            print(error)
        }
        return true
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error)
    }

}

