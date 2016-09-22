//
//  PaymentViewController.swift
//  SwiftingNotification
//
//  Created by Wojtek on 22/09/2016.
//  Copyright © 2016 roche. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor(netHex: 0x185F57)
    }
    
    @IBAction func payButtonTapped(_ sender: UIButton) {
        
        let pinVc = PPPinPadViewController()
        pinVc.delegate = self
        pinVc.errorTitle = "Pin code is incorrect"
        pinVc.pinTitle = "Enter sms code"
        pinVc.modalPresentationStyle = .overCurrentContext
        
        self.present(pinVc, animated: true, completion: nil)

    }
    
}

extension PaymentViewController: PinPadPasswordProtocol {
    
    func checkPin(_ pin: String!) -> Bool {
        return pin == "1234"
    }
    
    func pinLenght() -> Int {
        return 4
    }
    
    func pinPadSuccessPin() {
        
        
        performSegue(withIdentifier: "Success", sender: nil)
    }
}
