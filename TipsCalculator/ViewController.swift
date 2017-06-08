//
//  ViewController.swift
//  TipsCalculator
//
//  Created by Lon on 5/27/17.
//  Copyright © 2017 Lon. All rights reserved.
//
import Foundation
import UIKit

var defaults = UserDefaults.standard

class ViewController: UIViewController, UITextFieldDelegate, UIPageViewControllerDelegate{
    //label
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var percentTip: UILabel!
    @IBOutlet weak var personpayLabel: UILabel!
    //textFill
    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var splitLabel: UITextField!
    //Segment
    @IBOutlet weak var percentSegment: UISegmentedControl!
    
    //Button
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    //Slider
    @IBOutlet weak var TipRate: UISlider!
    
    //Variables
    var total = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.billText.delegate = self;
        self.splitLabel.delegate = self;
        // Do any additional setup after loading the view, typically from a nib.
        //       btnMenu.target = revealViewController()
        //        btnMenu.action = #selector(SWRevealViewController.revealToggle(_:))
        billText.becomeFirstResponder()
                self.SaveData()
    }
    override func viewWillAppear(_ animated: Bool) {
        if let tipRatePercent = defaults.object(forKey: "TipRate") as? Float {
            TipRate.value = tipRatePercent
            percentTip.text = "\(Int(tipRatePercent))%"
            switch tipRatePercent {
            case 25: percentSegment.selectedSegmentIndex = 2
            case 20: percentSegment.selectedSegmentIndex = 1
            default:
                percentSegment.selectedSegmentIndex = 0
            }
        }

    }
    func SaveData()  {
        defaults.set(billText.text, forKey: "numberOld")
        defaults.set(TipRate.value, forKey: "pct")
        defaults.set(personpayLabel.text, forKey: "personpay")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text == "" && (string == "0" || string == ","){
            return false
        }
        return true
    }
    
    @IBAction func Ontap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func item(_ sender: Any) {
        self.SaveData()
        let printview = self.storyboard?.instantiateViewController(withIdentifier: "PrintViewID") as! PrintBill
        self.navigationController?.pushViewController(printview, animated: true)
    }
    
    
    
    @IBAction func calcalatorTips(_ sender: AnyObject) {
        
        let tipPercenttages = [0.18, 0.2, 0.25]
        let bill = Double(billText.text!) ?? 0
        let tip = bill * tipPercenttages[percentSegment.selectedSegmentIndex]
        TipRate.value = Float(100 * tipPercenttages[percentSegment.selectedSegmentIndex])
        defaults.set(TipRate.value, forKey: "TipRate")
        percentTip.text = "\(Int(100 * tipPercenttages[percentSegment.selectedSegmentIndex]))%"
        total = bill + tip
        tipLabel.text = String(format:"$%.2f",(tip))
        totalLabel.text = String(format:"$%.2f",(total))
        let split = Double(splitLabel.text!) ?? 1
        let personpay = total / split
        personpayLabel.text = String(format:"$%.2f",(personpay))
        defaults.synchronize()
    }
    
    @IBAction func btnAqua() {
        self.view.backgroundColor = UIColor.init(red: 88/255, green: 160/255, blue: 248/255, alpha: 1)
    }
    @IBAction func btnLaveder() {
        self.view.backgroundColor = UIColor.init(red: 204/255, green: 102/255, blue: 255, alpha: 1)
    }
    
    @IBAction func btnFlora() {
        self.view.backgroundColor = UIColor.init(red: 102/255, green: 255/255, blue: 102/255, alpha: 1)
    }
    @IBAction func btnWhite() {
        self.view.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    }
    @IBAction func btnSalmon() {
        self.view.backgroundColor = UIColor.init(red: 255/255, green: 102/255, blue: 102/255, alpha: 1)
    }
    
    @IBAction func TipPercentageValueChange(_ sender: UISlider) {
        let bill1 = (billText.text!as NSString).doubleValue
        let person = Double(splitLabel.text!) ?? 1
        let sliderValue = Int(sender.value)
        let myTipPct = (Double(sliderValue) / 100)
        
        print(sender.value)
        
        let tipBill = bill1 * myTipPct
        let totalBill = bill1 + tipBill
        let psPay = (totalBill/person)
        percentTip.text = "\(Int(sliderValue))%"
        tipLabel.text = String(format:"$%.2f",tipBill)
        totalLabel.text = String(format:"$%.2f",totalBill)
        personpayLabel.text = String(format:"$%.2f",psPay)
        
        
        
    }
    
}


