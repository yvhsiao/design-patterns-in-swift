//
//  Utils.swift
//  Supermarket
//
//  Created by Yu-An Hsiao on 2019/1/7.
//  Copyright © 2019年 Yu-An Hsiao. All rights reserved.
//

import Foundation

extension Double {
    
    func toCurrencyString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        return formatter.string(from: self as NSNumber) ?? "$unkown"
    }
    
}
