//
//  ViewController.swift
//  SwiftingNotification
//
//  Created by woroninb on 24/07/16.
//  Copyright © 2016 roche. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

final class ViewController: UIViewController {
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        showCustomContentNotification()
    }
    
    func showCustomContentNotification() {

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)

        let content = NotificationContent(title: "", subTitle: "", body: "Coffee break!")
        
        content.categoryIdentifier = Consts.customContentIdentifier
        
        let request = UNNotificationRequest(identifier: Consts.requestIdentifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            UNUserNotificationCenter.current().delegate = self
            if (error != nil){
                //handle here
            }
        }
    }
}

extension UIViewController: UNUserNotificationCenterDelegate {
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Swift.Void) {
        completionHandler( [.alert])
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Swift.Void) {
        print("Tapped in notification")
    }
}
