//
//  ChangeBackground.swift
//  TipsCalculator
//
//  Created by Lon on 5/28/17.
//  Copyright © 2017 Lon. All rights reserved.
//

import UIKit

class ChangeBackGround:UIViewController{
//
//    @IBOutlet weak var sysCurrentcyLB: UILabel!
//    @IBOutlet weak var DollaCurrentcyLB: UILabel!
//    @IBOutlet weak var CurrentcyLB: UILabel!
//    

    @IBOutlet weak var sysCurrentcyLB: UILabel!
    @IBOutlet weak var CurrentcyLB: UILabel!
    @IBOutlet weak var DollaCurrentcy: UILabel!
    let currency: [String] = ["VietNam(Dong)", "Eurozone(EUR)", "United Kingdom(GBP)", "Japanese Yên(JPY)", "China(PNY)","Australia(AUD)","Indonesia(IDR)","Hong Kong(HKD)","Korea(KRW)"]
    let sysbol: [String] = ["VND", "€", "£", "¥", "¥","؋","Rp","$","₩"]
    let Country: [String] = ["flag_vietnam", "flag_EU", "flag_english", "flag_japanese", "flag_china", "flag_australia","flag_indonesia","flag_hongkong","flag_korea"]
    var total = Double()
    
    @IBOutlet weak var tableCountry: UITableView!
//    @IBOutlet weak var tableCountry: UITableView!
    override func viewDidLoad() {
        super .viewDidLoad()
        self.tableCountry.register(UITableViewCell.self, forCellReuseIdentifier: "ChangeBackGround")
       CurrentcyLB.text = String(format:"%.2f",(total))
       DollaCurrentcy.text = String(format:"%.2f",(total))
 }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.currency.count
   }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 //create a new cell if needed or reuse an old one
    let cell:UITableViewCell = self.tableCountry.dequeueReusableCell(withIdentifier: "ChangeBackGround") as UITableViewCell!
      // set the text from the data model
        cell.textLabel?.text = self.currency[indexPath.row]
       cell.imageView?.image = UIImage(named: self.Country[indexPath.row])
       
        return cell
    }
//let//    }

}
