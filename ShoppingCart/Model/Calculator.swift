//
//  File.swift
//  ShoppingCart
//
//  Created by Tan Vinh Phan on 11/6/18.
//  Copyright © 2018 PTV. All rights reserved.
//

import Foundation

class Calculator {
    var total: Double = 0
    var totalBeforeTax: Double
    var shippingCost: Double
    private var taxPercent: Double
    
    init(totalBeforeTax: Double, shippingCost: Double, taxPercent: Double) {
        self.totalBeforeTax = totalBeforeTax
        self.shippingCost = shippingCost
        self.taxPercent = taxPercent
    }
    
    func getTotalAfterTax() -> Double
    {
        let tax = totalBeforeTax * taxPercent/100
        total = totalBeforeTax + tax + shippingCost
        
        return total
    }
}
