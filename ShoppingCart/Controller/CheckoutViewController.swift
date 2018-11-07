//
//  PlaceOrderViewController.swift
//  ShoppingCart
//
//  Created by Tan Vinh Phan on 11/3/18.
//  Copyright © 2018 PTV. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {

    
    @IBOutlet weak var totalLabel: UILabel!
    var shoppingCart: ShoppingCart!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Checkout"
        updateUI()
    }
    
    func updateUI() -> Void {
         totalLabel.text = "$\(shoppingCart.getTotal())"
    }
    
    @IBAction func standardButtonDidTap(_ sender: Any) {
        shoppingCart.shippingType = ShippingType.standard
        updateUI()
        
        let alertStandardDelivery: UIAlertController = UIAlertController(title: "Standard Delivery", message: "You have chosen standard delivery successfully!", preferredStyle: .alert)
        let actionOK: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        showAlert(alert: alertStandardDelivery, action: actionOK)
        }
    
    @IBAction func expressButtonDidTap(_ sender: Any) {
        shoppingCart.shippingType = ShippingType.express
        updateUI()
        
        let alertExpressDelivery: UIAlertController = UIAlertController(title: "Express Delivery", message: "You have chosen express delivery successfully!", preferredStyle: .alert)
        let actionOK: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        showAlert(alert: alertExpressDelivery, action: actionOK)
        }
    
    @IBAction func placeButtonDidTap(_ sender: Any) {
        
        let alert: UIAlertController = UIAlertController(title: "Thank you", message: "Your total amout is \(shoppingCart.getTotal())$ with \(shoppingCart.shippingType) delivery, please choose confirm to continue", preferredStyle: .alert)
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        let confirmAction: UIAlertAction = UIAlertAction(title: "Confirm", style: .default) { (action) in
            //TODO: Alert success, and invite them to shop more
            let successAlert: UIAlertController = UIAlertController(title: "Success!", message: "You have purchased successfully", preferredStyle: .alert)
            let shopMoreAction = UIAlertAction(title: "Let's shop more", style: .default, handler: { (action) in
                self.shoppingCart.reset()
                self.navigationController?.popToRootViewController(animated: true)
            })
            self.showAlert(alert: successAlert, action: shopMoreAction)
        }
        
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    
}
    func showAlert(alert: UIAlertController, action: UIAlertAction) -> Void {
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
