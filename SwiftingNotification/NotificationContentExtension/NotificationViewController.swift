//
//  NotificationViewController.swift
//  NotificationContentExtension
//
//  Created by woroninb on 25/07/16.
//  Copyright © 2016 roche. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {
    
    @IBOutlet weak var option1: UIView!
    @IBOutlet weak var option2: UIView!
    @IBOutlet weak var option3: UIView!
    
    override func viewDidLoad() {

        option1.layer.cornerRadius = 10
        option2.layer.cornerRadius = 10
        option3.layer.cornerRadius = 10

        option1.layer.borderColor = UIColor(netHex: 0x185F57).cgColor
        option2.layer.borderColor = UIColor(netHex: 0x185F57).cgColor
        option3.layer.borderColor = UIColor(netHex: 0x185F57).cgColor

        option1.layer.borderWidth = 1
        option2.layer.borderWidth = 1
        option3.layer.borderWidth = 1
        
        option1.backgroundColor = UIColor.clear
        option2.backgroundColor = UIColor.clear
        option3.backgroundColor = UIColor.clear

        let tap = UITapGestureRecognizer(target: self, action: #selector(NotificationViewController.actionTapped))
        option1.addGestureRecognizer(tap)
    }
    
    func actionTapped() {
        
    }
    
    @IBAction func buttonTapped(_ sender: AnyObject) {
        print("Wojt")
        
    }
    
    
    func didReceive(_ notification: UNNotification) {
        
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
