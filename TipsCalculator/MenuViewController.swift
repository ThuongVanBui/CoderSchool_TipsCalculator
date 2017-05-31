//
//  MenuViewController.swift
//  TipsCalculator
//
//  Created by Lon on 5/29/17.
//  Copyright © 2017 Lon. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var MenuNameArr:Array = [String]()
    var IconImgArr:Array = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
            MenuNameArr	= ["Home", "Message","Phone","Infomation"]
        IconImgArr = [UIImage(named: "home-icon")!,UIImage(named: "email-2-icon")!,UIImage(named:"Phone-icon")!,UIImage(named:"infomation-icon")!]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuNameArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        cell.ImgIcon.image = IconImgArr[indexPath.row]
        cell.lbMenuName.text = MenuNameArr[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
