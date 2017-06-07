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
    var printbillUser:NSString!
    var printPersonPay:NSString!
    @IBOutlet weak var PrintBillLabel: UILabel!
    @IBOutlet weak var PrintPersonPayLable: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        printbillUser = defaults.object(forKey: "numberOld") as! NSString
        printPersonPay = defaults.object(forKey: "personpay") as! NSString
        
    }
    
    @IBAction func PrintBill(_ sender: AnyObject) {
        PrintBillLabel.text = printbillUser! as String
        PrintPersonPayLable.text = printPersonPay! as String
    }
}
