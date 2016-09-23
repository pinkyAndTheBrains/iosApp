//
//  PaymentViewController.swift
//  SwiftingNotification
//
//  Created by Wojtek on 22/09/2016.
//  Copyright © 2016 roche. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {
    
    var action: Action = .latte
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productName.text = action.description
        productPrice.text = action.price
        
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
        
        SwiftSpinner.hide()
        SwiftSpinner.show(delay: 0.0, title: "Authorizing...", animated: true)
        
        PaymentPrepareAPI.paymentPrepareGet(productId: self.action.identifier,
            completion: { (data, error) in
                
               let auth = TransactionAuth()
                auth.authCode = "1234"
                auth.transactionId = data?.replacingOccurrences(of: "\"", with: "") ?? "11221"
                
                PaymentFinalAPI.paymentFinalPost(transactionAuth: auth, completion: { (error) in
                
                    SwiftSpinner.hide()
                    print(error)
                    self.performSegue(withIdentifier: "Success", sender: nil)
                })
        })
        
        
    }
    
    func delay(seconds: Double, completion: @escaping () -> ()) {
        let popTime = DispatchTime.now() + Double(Int64( Double(NSEC_PER_SEC) * seconds )) / Double(NSEC_PER_SEC)
        
        DispatchQueue.main.asyncAfter(deadline: popTime) {
            completion()
        }
    }
}

