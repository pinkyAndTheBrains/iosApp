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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.barTintColor = UIColor(netHex: 0xE54B28)
    }
    @IBAction func barButtonTapped(_ sender: UIBarButtonItem) {
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
        
        let viewController: UIViewController = UIStoryboard(name: "Payment", bundle: nil).instantiateInitialViewController()!
        self.navigationController?.pushViewController(viewController, animated: false)
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    
    
}
