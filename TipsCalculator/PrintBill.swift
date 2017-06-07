//
//  PrintBill.swift
//  TipsCalculator
//
//  Created by Lon on 6/7/17.
//  Copyright © 2017 Lon. All rights reserved.
//

import Foundation
import UIKit
class PrintBill: UIViewController {
    var printbillUser = UserDefaults()
    var printPersonPay = UserDefaults()
   
    @IBOutlet weak var PrintPersonPayLable: UILabel!
    @IBOutlet weak var PrintBillLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        printbillUser = UserDefaults()
        printPersonPay = UserDefaults()
        
    }
    
    @IBAction func PrintBill(_ sender: Any) {
        PrintBillLabel.text = printbillUser.object(forKey: "totalbill_truyen") as! NSString as String
        PrintPersonPayLable.text = printPersonPay.object(forKey: "personpay_truyen") as! NSString as String
    }
}
