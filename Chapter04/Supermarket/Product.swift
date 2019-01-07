//
//  Product.swift
//  Supermarket
//
//  Created by Yu-An Hsiao on 2019/1/7.
//  Copyright © 2019年 Yu-An Hsiao. All rights reserved.
//

import Foundation

class Product {
    
    //:### private(set): 可被同Module的其他檔案讀取，但只能在該類別檔案下設值
    private(set) var name: String
    private(set) var category: String
    private(set) var description: String
    
    //:### private: 對其他檔案的程式碼隱藏實作
    private var _price: Double = 0
    private var _stockLevel = 0
    
    init(name: String, category: String, description: String, price: Double, stockLevel: Int) {
        self.name = name
        self.category = category
        self.description = description
        self.price = price
        self.stockLevel = stockLevel
    }
    
    //:### 開放讓其他類別檔案存取的值，是經由內部實作所產生的
    var stockLevel: Int {
        get { return _stockLevel }
        set { _stockLevel = max(0, newValue) }
    }
    
    private(set) var price: Double {
        get { return _price }
        set { _price = max(1, newValue) }
    }
    
    var stock: Double {
        return price * Double(stockLevel)
    }
}
