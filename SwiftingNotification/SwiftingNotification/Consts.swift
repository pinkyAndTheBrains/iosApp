//
//  Consts.swift
//  SwiftingNotification
//
//  Created by woroninb on 12/08/16.
//  Copyright © 2016 roche. All rights reserved.
//

import Foundation

struct Consts {
    static let requestIdentifier = "requestIdentifier"
    static let replyIdentifier = "replyIdentifier"
    static let categoryIdentifier = "catgeoryIdentifier"
    static let imageIdentifier = "imageIdentifier"
    static let customContentIdentifier = "customContentIdentifier"
}

enum Action: String {
    case latte
    case espresso
    case cappucino
    
    var identifier: Int32 {
        switch(self) {
        case .latte:
            return 1
        case .espresso:
            return 2
        case .cappucino:
            return 3
        }
    }
    
    var description: String {
        switch(self) {
        case .latte:
            return "Large latte"
        case .espresso:
            return "Large espresso"
        case .cappucino:
            return "Large cappucino"
        }
    }
    
    var price: String {
        switch(self) {
        case .latte:
            return "€6.00"
        case .espresso:
            return "€3.60"
        case .cappucino:
            return "€4.70"
        }
    }
}
