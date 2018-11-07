//
//  CartViewController.swift
//  ShoppingCart
//
//  Created by Tan Vinh Phan on 11/2/18.
//  Copyright © 2018 PTV. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var topImage: UIImageView!
    
    @IBOutlet weak var topProductLabel: UILabel!
    
    @IBOutlet weak var topPriceLabel: UILabel!
    
    @IBOutlet weak var topQuantityLabel: UILabel!
    @IBOutlet weak var topStepper: UIStepper!
    var topItemQuantity: Int = 0
    
    
    @IBOutlet weak var middleImage: UIImageView!
    @IBOutlet weak var middleProductLabel: UILabel!
    
    @IBOutlet weak var middlePriceLabel: UILabel!
    @IBOutlet weak var middleQuantityLabel: UILabel!
    @IBOutlet weak var middleStepper: UIStepper!
    var middleItemQuantity: Int = 0
    
    
    @IBOutlet weak var bottomImage: UIImageView!
    
    @IBOutlet weak var bottomProductLabel: UILabel!
    
    @IBOutlet weak var bottomPriceLabel: UILabel!
    
    @IBOutlet weak var bottomQuantityLabel: UILabel!
    
    @IBOutlet weak var bottomStepper: UIStepper!
    var bottomItemQuantity: Int = 0
    
    
    @IBOutlet weak var totalPricesLabel: UILabel!
    
    var shoppingCart: ShoppingCart!
    var itemStore: ItemStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.shoppingCart = ShoppingCart()
        self.itemStore = shoppingCart.itemStore
        updateCartUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if shoppingCart.getTotal() == 0 {
            self.reset()
        }
        updateCartUI()
    }
    
    func reset() -> Void {
        topItemQuantity = 0
        middleItemQuantity = 0
        bottomItemQuantity = 0
        topStepper.value = 0
        middleStepper.value = 0
        bottomStepper.value = 0
    }
    
    func updateCartUI() -> Void {
        if itemStore.items.count >= 3 {
            let topItem = itemStore.items[0]
                topImage.image = topItem.image
                topImage.layer.cornerRadius = 5.0
                topImage.layer.masksToBounds = true
                topProductLabel.text = topItem.name
                topPriceLabel.text = "$\(topItem.price)"
                topQuantityLabel.text = "\(topItemQuantity)"

            let middleItem = itemStore.items[1]
                middleImage.image = middleItem.image
                middleImage.layer.cornerRadius = 5.0
                middleImage.layer.masksToBounds = true
                middleProductLabel.text = middleItem.name
                middlePriceLabel.text = "$\(middleItem.price)"
                middleQuantityLabel.text = "\(middleItemQuantity)"

            let bottomItem = itemStore.items[2]
                bottomImage.image = bottomItem.image
                bottomImage.layer.cornerRadius = 5.0
                bottomImage.layer.masksToBounds = true
                bottomProductLabel.text = bottomItem.name
                bottomPriceLabel.text = "$\(bottomItem.price)"
                bottomQuantityLabel.text = "\(bottomItemQuantity)"

            let totalAmount = shoppingCart.getTotal()
            totalPricesLabel.text = "$\(totalAmount)"
        }
    }

    @IBAction func topStepperValueChanged(_ sender: UIStepper)
    {
        let newQuantity = Int(sender.value)
        if newQuantity > topItemQuantity {
            shoppingCart.add(item: itemStore.items[0])
        } else if newQuantity < topItemQuantity
        {
            shoppingCart.remove(item: itemStore.items[0])
        }

        topItemQuantity = newQuantity
        self.updateCartUI()
    }

    @IBAction func middleStepperValueChanged(_ sender: UIStepper)
    {
        let newQuantiy = Int(sender.value)
        if newQuantiy > middleItemQuantity {
            shoppingCart.add(item: itemStore.items[1])
        } else if newQuantiy < middleItemQuantity
        {
            shoppingCart.remove(item: itemStore.items[1])
        }

        middleItemQuantity = newQuantiy
        self.updateCartUI()
    }

    @IBAction func bottomStepperValueChanged(_ sender: UIStepper)
    {
        let newQuantiy = Int(sender.value)
        if newQuantiy > bottomItemQuantity {
            shoppingCart.add(item: itemStore.items[2])
        } else if newQuantiy < bottomItemQuantity
        {
            shoppingCart.remove(item: itemStore.items[2])
        }

        bottomItemQuantity = newQuantiy
        self.updateCartUI()
    }

    struct StoryBoard {
        static let PlaceOrder: String = "PlaceOrder"
    }

    @IBAction func placeOrderDidTap(_ sender: Any)
    {
        performSegue(withIdentifier: StoryBoard.PlaceOrder, sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryBoard.PlaceOrder {
            if let placeOrderVC: CheckoutViewController = segue.destination as? CheckoutViewController {
                    placeOrderVC.shoppingCart = shoppingCart
                }
        }
    }

}
