//
//  Orders.swift
//  ShoppingCart
//
//  Created by Tan Vinh Phan on 11/2/18.
//  Copyright © 2018 PTV. All rights reserved.
//

import Foundation

enum ShippingType: Double {
    case standard = 0.0
    case express = 15.00
}

class ShoppingCart {
    //selectedItemsDict [uid : quantity]
    var total: Double = 0
    var selectedItemsDict: [String : Int] = [ : ]
    var shippingType: ShippingType = .standard
    var itemStore = ItemStore()
    private var taxPercent: Double = 10.0
    
    func getTotal() -> Double {
        var totalBeforeTax: Double = 0
        for (uid, quantity) in selectedItemsDict {
            if let price = itemStore.getPriceFor(ItemWith: uid) {
               totalBeforeTax += price * Double(quantity)
            }
        }
        let calculator: Calculator = Calculator(totalBeforeTax: totalBeforeTax, shippingCost: shippingType.rawValue, taxPercent: taxPercent)
        
        return calculator.getTotalAfterTax()
    }
    
    func reset() -> Void {
        self.total = 0
        self.selectedItemsDict = [ : ]
        self.shippingType = .standard
    }
    
    func add(item: Item) -> Void {
        if var quantiy = selectedItemsDict[item.uid] {
            quantiy += 1
            selectedItemsDict[item.uid] = quantiy
        }
        else
        {
            selectedItemsDict[item.uid] = 1
        }
    }
    
    func remove(item: Item) -> Void {
        if var quantity = selectedItemsDict[item.uid] {
            quantity -= 1
            selectedItemsDict[item.uid] = quantity
        }
    }
    
}

