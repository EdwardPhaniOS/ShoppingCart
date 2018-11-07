//
//  Order.swift
//  ShoppingCart
//
//  Created by Tan Vinh Phan on 11/2/18.
//  Copyright © 2018 PTV. All rights reserved.
//

import UIKit

struct Item {
    var uid: String
    var name: String
    var price: Double
    var quantity: Int
    var image: UIImage
}

class ItemStore {
    
    var items: [Item] = [
    Item(uid: "1", name: "iPad Pro", price: 599.0, quantity: 10, image: UIImage(named: "img_ipad")!),
    Item(uid: "2", name: "Apple Watch", price: 299.0, quantity: 10, image: UIImage(named: "img_watch")!),
    Item(uid: "3", name: "Apple TV", price: 199.0, quantity: 10, image: UIImage(named: "img_tv")!)
        
    ]
    
    func getPriceFor(ItemWith uid: String) -> Double? {
        for item in items {
            if item.uid == uid {
                return item.price
            }
        }
        return nil
    }
    
}
