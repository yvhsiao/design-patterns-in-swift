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
  
  var productID: Int?
  
}

class ViewController: UIViewController {

  @IBOutlet weak var totalStockLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!
  
  var products = [
    ("Apple", "Apple description Bla Bla Bla.", "Fruit", 10.0, 0),
    ("Banana", "Banana description Bla Bla Bla.", "Fruit", 15.0, 0),
    ("Mango", "Mango description Bla Bla Bla.", "Fruit", 20.0, 0),
    ("Tomato", "Tomato description Bla Bla Bla.", "Vegetables", 25.0, 0),
    ("Onion", "Onion description Bla Bla Bla.", "Vegetables", 30.0, 0),
    ("Mushroom", "Mushroom description Bla Bla Bla.", "Vegetables", 35.0, 0),
    ("Chicken", "Chicken description Bla Bla Bla.", "Meat", 40.0, 0),
    ("Beef", "Beef description Bla Bla Bla.", "Meat", 45.0, 0),
    ("Pork", "Pork description Bla Bla Bla.", "Meat", 50.0, 0) ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    displayStockTotal()
  }

  @IBAction func stockLevelDidChange(_ sender: Any) {
    if var currentCell = sender as? UIView {
      while (true) {
        currentCell = currentCell.superview!;
        if let cell = currentCell as? ProductTableViewCell {
          if let id = cell.productID {
            
            var newStockLevel:Int?
            
            if let stepper = sender as? UIStepper {
              newStockLevel = Int(stepper.value);
            } else if let textfield = sender as? UITextField {
              if let newValue = Int(textfield.text ?? "") {
                newStockLevel = newValue
              }
            }
            
            if let level = newStockLevel {
              products[id].4 = level;
              cell.stockStepper.value = Double(level)
              cell.stockTextField.text = String(level)
            }
          }
          break
        }
      }
      displayStockTotal()
    }
  }
  
  func displayStockTotal() {
    let stockTotal = products
      .reduce(0) { (total, product) in total + product.4 }
    
    totalStockLabel.text = "\(stockTotal) Products in Stock"
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
    
    cell.productID = indexPath.row
    cell.nameLabel.text = product.0
    cell.descriptionLabel.text = product.1
    cell.stockStepper.value = Double(product.4)
    cell.stockTextField.text = String(product.4)
    return cell
  }
  
}

