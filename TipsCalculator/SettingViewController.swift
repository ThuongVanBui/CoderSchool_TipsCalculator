//
//  SettingViewController.swift
//  TipsCalculator
//
//  Created by Lon on 6/8/17.
//  Copyright © 2017 Lon. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var percentLabel: UILabel!
    
    @IBOutlet weak var percentSlider: UISlider!
    
    var percentTip: Int = 0{
        didSet {
            percentLabel.text = "\(Int(percentTip)) %"
            percentSlider.value = Float(percentTip)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        percentSlider.maximumValue = 100
        percentSlider.minimumValue = 0
        
        if let tipRatePercent = defaults.object(forKey: "TipRate") as? Float {
            percentTip = Int(tipRatePercent)
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func Onsave(_ sender: UIBarButtonItem) {
        defaults.set(percentTip, forKey: "TipRate")
        defaults.synchronize()
        self.navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func onPercent(_ sender: UISlider) {
        percentTip = Int(sender.value)
        print(sender.value)
    }
}
