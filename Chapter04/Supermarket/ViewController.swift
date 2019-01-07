//
//  ViewController.swift
//  Supermarket
//
//  Created by Yu-An Hsiao on 2019/1/5.
//  Copyright © 2019年 Yu-An Hsiao. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stockStepper: UIStepper!
    @IBOutlet weak var stockTextField: UITextField!
    
    var product: Product?
//    var productID: Int?
}

class ViewController: UIViewController {
    
    @IBOutlet weak var totalStockLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //:### 套用Product物件取代原先的Turple
    var products = [
        Product(name: "Apple", category: "Fruit", description: "Apple description Bla Bla Bla.", price: 10.0, stockLevel: 0),
        Product(name: "Banana", category: "Fruit", description: "Banana description Bla Bla Bla.", price: 15.0, stockLevel: 0),
        Product(name: "Mango", category: "Fruit", description: "Mango description Bla Bla Bla.", price: 20.0, stockLevel: 0),
        Product(name: "Tomato", category: "Vegetables", description: "Tomato description Bla Bla Bla.", price: 25.0, stockLevel: 0),
        Product(name: "Onion", category: "Vegetables", description: "Onion description Bla Bla Bla.", price: 30.0, stockLevel: 0),
        Product(name: "Mushroom", category: "Vegetables", description: "Mushroom description Bla Bla Bla.", price: 35.0, stockLevel: 0),
        Product(name: "Chicken", category: "Meat", description: "Chicken description Bla Bla Bla.", price: 40.0, stockLevel: 0),
        Product(name: "Beef", category: "Meat", description: "Beef description Bla Bla Bla.", price: 45.0, stockLevel: 0),
        Product(name: "Pork", category: "Meat", description: "Pork description Bla Bla Bla.", price: 50.0, stockLevel: 0) ]
//    var products = [
//        ("Apple", "Apple description Bla Bla Bla.", "Fruit", 10.0, 0),
//        ("Banana", "Banana description Bla Bla Bla.", "Fruit", 15.0, 0),
//        ("Mango", "Mango description Bla Bla Bla.", "Fruit", 20.0, 0),
//        ("Tomato", "Tomato description Bla Bla Bla.", "Vegetables", 25.0, 0),
//        ("Onion", "Onion description Bla Bla Bla.", "Vegetables", 30.0, 0),
//        ("Mushroom", "Mushroom description Bla Bla Bla.", "Vegetables", 35.0, 0),
//        ("Chicken", "Chicken description Bla Bla Bla.", "Meat", 40.0, 0),
//        ("Beef", "Beef description Bla Bla Bla.", "Meat", 45.0, 0),
//        ("Pork", "Pork description Bla Bla Bla.", "Meat", 50.0, 0) ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayStockTotal()
    }
    
    @IBAction func stockLevelDidChange(_ sender: Any) {
        if var currentCell = sender as? UIView {
            while (true) {
                currentCell = currentCell.superview!;
                if let cell = currentCell as? ProductTableViewCell {
                    if let product = cell.product {
//                    if let id = cell.productID {
                        
//                        var newStockLevel:Int?
                        
                        if let stepper = sender as? UIStepper {
                            product.stockLevel = Int(stepper.value)
//                            newStockLevel = Int(stepper.value);
                        } else if let textfield = sender as? UITextField {
                            if let newValue = Int(textfield.text ?? "") {
                                product.stockLevel = newValue
//                                newStockLevel = newValue
                            }
                        }
                        
                        cell.stockStepper.value = Double(product.stockLevel)
                        cell.stockTextField.text = String.init(product.stockLevel)
//                        if let level = newStockLevel {
//                            products[id].4 = level;
//                            cell.stockStepper.value = Double(level)
//                            cell.stockTextField.text = String(level)
//                        }
                    }
                    break
                }
            }
            displayStockTotal()
        }
    }
    
    func displayStockTotal() {
        
        //:### Turple方便在獨立且不為全域資料時使用，這種情況下若採用Struct或Class顯得有點大材小用，因為Turple的資料不會顯露在方法外，運用Turple的功能不會因為緊密耦合與四處傳遞導致維護困難。
        let finalTotals = products.reduce((stockLevel: 0, stock: 0.0)) { (totals, product) in
            return (totals.stockLevel + product.stockLevel,
                    totals.stock + product.stock)
        }
//        let stockTotal = products
//            .reduce(0) { (total, product) in total + product.4 }
        
        //:### 擴充顯示商品總金額
        totalStockLabel.text = "\(finalTotals.stockLevel) Products in Stock. Total Value: \(finalTotals.stock.toCurrencyString())"
//        totalStockLabel.text = "\(stockTotal) Products in Stock"
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductTableViewCell.self)) as? ProductTableViewCell else {
            fatalError("ProductTableViewCell Dequeue Error")
        }
        
        cell.product = product
        cell.nameLabel.text = product.name
        cell.descriptionLabel.text = product.description
        cell.stockStepper.value = Double(product.stockLevel)
        cell.stockTextField.text = String(product.stockLevel)
//        cell.productID = indexPath.row
//        cell.nameLabel.text = product.0
//        cell.descriptionLabel.text = product.1
//        cell.stockStepper.value = Double(product.4)
//        cell.stockTextField.text = String(product.4)
        
        return cell
    }
    
}

