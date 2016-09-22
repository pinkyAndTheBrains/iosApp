//
//  PaymentSuccessViewController.swift
//  SwiftingNotification
//
//  Created by Wojtek on 22/09/2016.
//  Copyright © 2016 roche. All rights reserved.
//

import UIKit

class PaymentSuccessViewController: UIViewController {
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        _ = navigationController?.popToRootViewController(animated: true)
    }
}
